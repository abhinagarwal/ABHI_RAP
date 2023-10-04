@EndUserText.label: 'Projection for Travel BO'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZABHIRAP_TRAV_12PRO
  as projection on ZABHIRAP_TRAV_12_P
{
  key TravelUuid,

      TravelId,

      @Consumption.valueHelpDefinition: [{
          entity: {
              name: '/DMO/I_Agency',
              element: 'AgencyID'
          }
          }]
      @ObjectModel.text.element: ['AgencyName']
      @Search.defaultSearchElement: true
      AgencyId,
      _Agency.Name       as AgencyName,

      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Customer', element: 'CustomerID'} }]
      @ObjectModel.text.element: ['CustomerName']
      @Search.defaultSearchElement: true
      CustomerId,
      _Customer.LastName as CustomerName,

      BeginDate,

      EndDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,

      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Currency', element: 'Currency'} }]
      CurrencyCode,

      Description,
      OverallStatus,
//      CreatedBy,
//      CreatedAt,
//      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,

      /* Associations */
      _Agency,
      _Booking : redirected to composition child ZABIRAP_BOOK_12PRO,
      _Currency,
      _Customer
}
