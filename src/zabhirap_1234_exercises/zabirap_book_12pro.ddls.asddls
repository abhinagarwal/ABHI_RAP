@EndUserText.label: 'Projection for Booking BO'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define view entity ZABIRAP_BOOK_12PRO as projection on ZABHIRAP_BOOK_12_P
{
    key BookingUuid,
    TravelUuid,
    @Search.defaultSearchElement: true
    BookingId,
    BookingDate,
    @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Customer' , element: 'CustomerID' } }]
    @ObjectModel.text.element: ['CustomerName']
    @Search.defaultSearchElement: true
    CustomerId,
    _Customer.LastName as CustomerName,
    @Consumption.valueHelpDefinition: [{
        entity: {
            name: '/DMO/I_Carrier',
            element: 'AirlineID'
        }                 
    }]
    @ObjectModel.text.element: [ 'CustomerName' ]
    CarrierId,
    _Carrier.Name as CarrierName, 
    @Consumption: {    
        valueHelpDefinition: [{
            entity: {
                name: '/DMO/I_Flight',
                element: 'ConnectioID'
            },
            additionalBinding: [    { localElement: 'CarrierID', element: 'AirlineID'},
                                    { localElement: 'FlightDate', element: 'FlightDate' , usage : #RESULT},
                                    { localElement: 'FlightPrice',element: 'Price' , usage : #RESULT},
                                    { localElement: 'CurrencyCode', element: 'CurrencyCode' , usage : #RESULT}                                    
            ]
            
        }]
    }
    
    ConnectionId,
    FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    FlightPrice,
    @Consumption.valueHelpDefinition: [{entity: {name: 'I_Currency', element: 'Currency' }}]
    CurrencyCode,
    CreatedBy,
    LastChangedBy,
    LocalLastChangedAt,
    
    
    /* Associations */
    _Carrier,
    _Connection,
    _Currency,
    _Customer,
    _Flight,
    _Travel : redirected to parent ZABHIRAP_TRAV_12PRO
}
