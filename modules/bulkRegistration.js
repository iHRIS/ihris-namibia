const isEmpty = require("is-empty");
const { extensions } = require("sequelize/lib/utils/validator-extras");
const {v4: uuidv4} = require("uuid");

const validateDate = (input) => {
    return new Date(input).toString() !== 'Invalid Date';
}
const userDataValidation = (userData) => {
    const validation = {
        isValid: true,
        data: "",
        message: [],
    };

    userData.map((user, index) => {
        let errors = [];
        let oldKeys = Object.keys(user);
        let newKeys = Object.keys(user).map((ol) => ol.split(" ").join("_"));
        /*if (user.practitionerIsExist === true) {
            validation.isValid = false;
            errors.push(`User at row ${index + 2}  is already exist in the system`);
        }*/
        for (let i = 0; i < oldKeys.length; i++) {
            user[newKeys[i]] = user[oldKeys[i]];
            if (newKeys[i] === oldKeys[i]) {
              continue;
            } else {
                delete user[oldKeys[i]];
            }
        }

        let reference = [
          {Gender: "genderCoding"},
          {Nationality: "nationalityCoding"},
          {JobTitle: "jobCoding"},
          {EmploymentTerms: "employmentCoding"},
          {FacilityName: "facilityId"},
          {QualificationLevel: "educationCoding"},
          {TrainingType: "trainingCoding"},
          {Supervisor: "supervisorCoding"},
          {RacialGroup: "racialCoding"},
          {MaritalStatus: "maritalCoding"},
          {Disability: "disabilityCoding"},
        ];

        let dateType = [
            "BirthDate",
            "StartDate",
            "EndDate",
            "YearObtained",
            "TrainingStartDate",
            "TrainingEndDate"
        ]

        dateType.forEach((key, index) => {
          if(user[`${key}`] != null ){
            if (!validateDate(user[`${key}`])) {
              console.log(user[`${key}`])
              validation.isValid = false;
              errors.push(`${key} is not a valid date please enter in YYYY-MM-DD format`);
            } else {
                user[`${key}`] = new Date(user[`${key}`])
                user[`${key}`].setDate(user[`${key}`].getDate())
            }
          }
        })

        reference.forEach((data, index) => {
            if (
                !isEmpty(user[`${Object.keys(data)[0]}`]) &&
                user[`${Object.values(data)[0]}`] === undefined
            ) {
                validation.isValid = false;
                user.index = index + 1;
                validation.data = user;
                errors.push(
                    `Please check if ${Object.values(data)[0]} ${
                        user[`${Object.keys(data)[0]}`]
                    } exists in a system or check the spelling.`
                );
            }
        });

        /* let requiredFieldKeys = [
            "PMIS",
            "FileNumber",
            "FirstName",
            "FatherName",
            "Grand_Father_Name",
            "Sex",
            "Date_of_Birth",
            "Marital_Status",
        ];

        requiredFieldKeys.forEach((key, index) => {
            if (isEmpty(user[`${key}`])) {
                validation.isValid = false;
                user.index = index + 1;
                validation.data = user;
                errors.push(`user ${key} is missing`);
            }
        });*/

        if (errors.length > 0) {
            validation.message.push({
                index: index + 2,
                errors: errors,
            });
        }
    });
    return validation;
};

let bundle = {
    resourceType: "Bundle",
    type: "transaction",
    entry: [],
};

const template = async (users) => {
    let bundleData = [];

    users.map(async (user) => {
        let userId = uuidv4();
        let oldKeys = Object.keys(user);
        let newKeys = Object.keys(user).map((ol) => ol.split(" ").join("_"));

        for (let i = 0; i < oldKeys.length; i++) {
            user[newKeys[i]] = user[oldKeys[i]];
            if (newKeys[i] === oldKeys[i]) {
              continue;
            } else {
                delete user[oldKeys[i]];
            }
        }

        bundleData = [
            ...bundleData,
            {
                resource: {
                    resourceType: "Practitioner",
                    meta: {
                        profile: [
                            "http://ihris.org/fhir/StructureDefinition/ihris-practitioner",
                        ],
                    },
                    extension: [
                        {
                          url: "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-nationality",
                          valueCoding: user["nationalityCoding"]
                        },
                        {
                          url: "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-marital-status",
                          valueCoding: user["maritalCoding"]
                        },
                        {
                          url: "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-racial-group",
                          valueCoding: user["racialCoding"]
                        },
                        {
                          url: "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-physical-status",
                          valueCoding: user["disabilityCoding"]
                        },
                        {
                            url: "http://ihris.org/fhir/StructureDefinition/ihris-related-group",
                            extension: [
                                {
                                    url: "practitioner",
                                    valueString: `Practitioner/${userId}`,
                                },
                                ...user["relatedGroup"],
                            ],
                        },
                    ],
                    identifier: [
                        {
                            type: {
                                coding: [
                                    {
                                        system: "http://ihris.org/fhir/CodeSystem/ihris-namibia-identifier",
                                        code: "nationalIN",
                                        display: "National Identification Number"
                                    },
                                ],
                            },
                            value: user["NationalID"],
                        },
                        {
                            type: {
                                coding: [
                                    {
                                        system: "http://ihris.org/fhir/CodeSystem/ihris-namibia-identifier",
                                        code: "employeeId",
                                        display: "Employee Id"
                                    },
                                ],
                            },
                            value: user["OtherIdentification"],
                        },
                        {
                          type: {
                              coding: [
                                  {
                                      system: "http://terminology.hl7.org/CodeSystem/v2-0203",
                                      code: "EN",
                                      display: "Employer number"
                                  },
                              ],
                          },
                          value: user["EmployeeNumber"],
                      }
                    ],
                    telecom: [
                      {
                          system : "phone",
                          value: user["Telephone"],
                      },
                      {
                        system : "sms",
                        value: user["Mobile"],
                      }, 
                      {
                        system : "email",
                        value: user["Email"],
                      }, 
                    ],
                    active: true,
                    name: [
                        {
                            use: "official",
                            text: user["FirstName"] + " " + user["Surname"] + " " + user["OtherNames"],
                            given: user["FirstName"],
                            family: user["Surname"],
                            extension: {
                              url: "http://ihirs.org/fhir/StructureDefinition/ihris-practitioner-othername",
                              valueString: user["OtherNames"]
                            }
                        }
                    ],
                    gender: user["genderCoding"].code,
                    birthDate: user["BirthDate"],
                },
                request: {
                    method: "PUT",
                    url: `Practitioner/${userId}`,
                },
            },
            {
              resource: {
                resourceType: "PractitionerRole",
                meta: {
                  profile: [
                    "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role",
                  ],
                },
                extension: [
                  {
                    url: "http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-employment-terms",
                    valueCoding: user["employmentCoding"]
                  },
                  {
                    url: "http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-supervisor",
                    valueCoding: user["supervisorCoding"]
                  },
                  {
                    url: "http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-salary",
                    valueMoney: { value : user["Salary"] , currency : "NAD" }
                  }
                ],
                period: {
                  start: user["StartDate"],
                  end: user["EndDate"]
                },
                practitioner: {
                  reference: `Practitioner/${userId}`
                },
                location: [
                  {
                    reference: `Location/${user["facilityId"]}`
                  }
                ],
                active: true,
                code: [
                  {
                    coding: [
                      user["jobCoding"]
                    ],
                  },
                ],
              },
              request: {
                method: "POST",
                url: "PractitionerRole",
              }
            },
            {
              resource: {
                resourceType: "Basic",
                meta: {
                  profile: [
                    "http://ihris.org/fhir/StructureDefinition/ihris-basic-education-history",
                  ],
                },
                extension: [
                  {
                    url: "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference",
                    valueReference: {
                      reference: `Practitioner/${userId}`,
                    },
                  },
                  {
                    url: "http://ihris.org/fhir/StructureDefinition/ihris-education-history",
                    extension: [
                      {
                        url: "level",
                        valueCoding: user["educationCoding"]
                      },
                      {
                        url: "institution",
                        valueString: user["InstitutionName"]
                      },
                      {
                        url: "qualification",
                        valueString: user["Qualification"]
                      },
                      {
                        url: "year",
                        valueDate: user["Year"]
                      }
                    ],
                  },
                ],
              },
              request: {
                method: "POST",
                url: "Basic",
              }
            },
            {
              resource: {
                resourceType: "Basic",
                meta: {
                  profile: [
                    "http://ihris.org/fhir/StructureDefinition/ihris-basic-emergency",
                  ],
                },
                extension: [
                  {
                    url: "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference",
                    valueReference: {
                      reference: `Practitioner/${userId}`,
                    },
                  },
                  {
                    url: "http://ihris.org/fhir/StructureDefinition/ihris-emergency",
                    extension: [
                      {
                        url: "name",
                        valueString: user["NOK"]
                      }
                    ],
                  },
                ],
              },
              request: {
                method: "POST",
                url: "Basic",
              }
            },
            {
              resource: {
                resourceType: "Basic",
                meta: {
                  profile: [
                    "http://ihris.org/fhir/StructureDefinition/ihris-basic-banking",
                  ],
                },
                extension: [
                  {
                    url: "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference",
                    valueReference: {
                      reference: `Practitioner/${userId}`,
                    },
                  },
                  {
                    url: "http://ihris.org/fhir/StructureDefinition/ihris-banking",
                    extension: [
                      {
                        url: "accountNumber",
                        valueString: user["Bank"]
                      }
                    ],
                  },
                ],
              },
              request: {
                method: "POST",
                url: "Basic",
              }
            },
            {
              resource: {
                resourceType: "Basic",
                meta: {
                  profile: [
                    "http://ihris.org/fhir/StructureDefinition/ihris-basic-inservice-training",
                  ],
                },
                extension: [
                  {
                    url: "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference",
                    valueReference: {
                      reference: `Practitioner/${userId}`,
                    },
                  },
                  {
                    url: "http://ihris.org/fhir/StructureDefinition/ihris-inservice-training",
                    extension: [
                      {
                        url: "provider",
                        valueString: user["TrainingOrganization"]
                      },
                      {
                        url: "training",
                        valueCoding: user["trainingCoding"]
                      },
                      {
                        url: "courseName",
                        valueString: user["Course"]
                      },
                      {
                        url: "startDate",
                        valueDate: user["TrainingStartDate"]
                      },
                      {
                        url: "endDate",
                        valueString: user["TrainingEndDate"]
                      }
                    ],
                  }
                ]
              },
              request: {
                method: "POST",
                url: "Basic",
              }
            }
        ];
    });
    return bundleData;
};

function processJobs(usersData) {
    return new Promise((resolve, reject) => {
        const validation = userDataValidation(usersData);
        if (!validation.isValid) {
            resolve(validation);
        } else {
            template(usersData)
                .then((practitionerDetails) => {
                    bundle.entry = practitionerDetails
                })
                .then(() => {
                    validation.isValid = true;
                    validation.data = {bundle};
                })
                .then(() => {
                    resolve(validation);
                });
        }
    });
}

module.exports = processJobs; 