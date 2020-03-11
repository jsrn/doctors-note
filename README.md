# Doctors Note

![rspec](https://github.com/jsrn/doctors-note/workflows/rspec/badge.svg)

Uses the [serverless](https://serverless.com/) framework to return a [FHIR](http://hl7.org/fhir/) formatted [Condition](https://www.hl7.org/fhir/condition.html) containing an excuse not to work today.

```
{
  "resourceType": "Condition",
  "id": "excuse",
  "text": {
    "status": "generated",
    "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\">Moderate headache (Date: 11-March 2020)</div>"
  },
  "clinicalStatus": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/condition-clinical",
        "code": "active"
      }
    ]
  },
  "verificationStatus": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/condition-ver-status",
        "code": "confirmed"
      }
    ]
  },
  "category": [
    {
      "coding": [
        {
          "system": "http://terminology.hl7.org/CodeSystem/condition-category",
          "code": "encounter-diagnosis",
          "display": "Encounter Diagnosis"
        },
        {
          "system": "http://snomed.info/sct",
          "code": "439401001",
          "display": "Diagnosis"
        }
      ]
    }
  ],
  "severity": {
    "coding": [
      {
        "system": "http://snomed.info/sct",
        "code": "6736007",
        "display": "Moderate"
      }
    ]
  },
  "code": {
    "coding": [
      {
        "system": "http://snomed.info/sct",
        "code": "25064002",
        "display": "Headache"
      }
    ],
    "text": "Headache"
  },
  "subject": {
    "reference": "Patient/you"
  },
  "onsetDateTime": "2020-03-11",
  "note": [
    {
      "text": "Add more conditions at https://github.com/jsrn/doctors-note"
    }
  ]
}
```
