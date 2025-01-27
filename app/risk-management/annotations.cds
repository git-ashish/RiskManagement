using RiskService as service from '../../srv/risk-service';
using from '../../db/schema';

annotate service.Risks with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'title',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'owner',
                Value : owner,
            },
            {
                $Type : 'UI.DataField',
                Label : 'prio_code',
                Value : prio_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'descr',
                Value : descr,
            },
            {
                $Type : 'UI.DataField',
                Label : 'impact',
                Value : impact,
            },
            {
                $Type : 'UI.DataField',
                Label : 'criticality',
                Value : criticality,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PrioCriticality',
                Value : PrioCriticality,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Risk Overview',
            ID : 'RiskOverview',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Risk Details',
                    ID : 'RiskDetails',
                    Target : '@UI.FieldGroup#RiskDetails',
                },
                {
                    $Type : 'UI.CollectionFacet',
                    Label : '{i18n>MitigationOverview}',
                    ID : 'i18nMitigationOverview',
                    Facets : [
                        {
                            $Type : 'UI.ReferenceFacet',
                            Label : '{i18n>MitigationDetails}',
                            ID : 'i18nMitigationDetails',
                            Target : '@UI.FieldGroup#i18nMitigationDetails',
                        },
                    ],
                },
            ],
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Title1}',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Owner1}',
            Value : owner,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Priority}',
            Value : prio_code,
        },
        {
            $Type : 'UI.DataField',
            Value : impact,
            Label : 'impact',
        },
        {
            $Type : 'UI.DataField',
            Value : miti.descr,
            Label : '{i18n>Mitigation}',
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : 'bp/@Communication.Contact#contact2',
            Label : 'Contact Name',
        },
    ],
    UI.SelectionFields : [
        prio_code,
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : descr,
        },
        TypeImageUrl : 'sap-icon://alert',
    },
    UI.FieldGroup #RiskDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
                Label : '{i18n>Title1}',
            },
            {
                $Type : 'UI.DataField',
                Value : owner,
                Label : '{i18n>Owner1}',
            },
            {
                $Type : 'UI.DataField',
                Value : descr,
                Label : '{i18n>Description}',
            },
            {
                $Type : 'UI.DataField',
                Value : prio_code,
            },
            {
                $Type : 'UI.DataField',
                Value : impact,
                Label : '{i18n>Impact1}',
            },
        ],
    },
    UI.FieldGroup #i18nMitigationDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : miti_ID,
                Label : '{i18n>Id}',
            },
            {
                $Type : 'UI.DataField',
                Value : miti.owner,
                Label : '{i18n>Owner1}',
            },
            {
                $Type : 'UI.DataField',
                Value : miti.timeline,
                Label : '{i18n>Timeline}',
            },
        ],
    },
);

annotate service.Risks with {
    miti @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Mitigations',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : miti_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'descr',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'owner',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'timeline',
                },
            ],
        },
        Common.Text : descr,
    )
};

annotate service.Risks with {
    prio @Common.Label : '{i18n>Priority}'
};

annotate service.Priority with {
    code @Common.Label : 'prio/code'
};

annotate service.Mitigations with {
    owner @Common.FieldControl : #ReadOnly
};

annotate service.Mitigations with {
    timeline @Common.FieldControl : #ReadOnly
};

annotate service.BusinessPartners with @(
    Communication.Contact #contact : {
        $Type : 'Communication.ContactType',
        fn : FullName,
    },
    Communication.Contact #contact1 : {
        $Type : 'Communication.ContactType',
        fn : FullName,
    },
    Communication.Contact #contact2 : {
        $Type : 'Communication.ContactType',
        fn : FullName,
    },
);

