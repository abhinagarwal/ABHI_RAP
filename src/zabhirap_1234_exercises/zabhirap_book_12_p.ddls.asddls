/*@AbapCatalog.viewEnhancementCategory: [#NONE]*/
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BO of Booking table'
/*@Metadata.ignorePropagatedAnnotations: true*/
/*@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}*/
define view entity ZABHIRAP_BOOK_12_P
  as select from zabhirap_book_12 as Booking
  
//  association [1..1] to  ZABHIRAP_TRAV_12_P as _Travel     on  $projection.TravelUuid = _Travel.TravelUUid
  association to parent ZABHIRAP_TRAV_12_P as _Travel     on  $projection.TravelUuid = _Travel.TravelUuid

  association [1..1] to /DMO/I_Customer    as _Customer   on  $projection.CustomerId = _Customer.CustomerID
  association [1..1] to /DMO/I_Carrier     as _Carrier    on  $projection.CarrierId = _Carrier.AirlineID
  association [1..1] to /DMO/I_Connection  as _Connection on  $projection.CarrierId    = _Connection.AirlineID
                                                          and $projection.ConnectionId = _Connection.ConnectionID
  association [1..1] to /DMO/I_Flight      as _Flight     on  $projection.CarrierId    = _Flight.AirlineID
                                                          and $projection.ConnectionId = _Flight.ConnectionID
                                                          and $projection.FlightDate   = _Flight.FlightDate
  association [0..1] to I_Currency         as _Currency   on  $projection.CurrencyCode = _Currency.Currency
{
  key booking_uuid          as BookingUuid,
      travel_uuid           as TravelUuid,
      booking_id            as BookingId,
      booking_date          as BookingDate,
      customer_id           as CustomerId,
      carrier_id            as CarrierId,
      connection_id         as ConnectionId,
      flight_date           as FlightDate,
      currency_code         as CurrencyCode,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price          as FlightPrice,
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.user.lastChangedBy: true
      last_changed_by       as LastChangedBy,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_at as LocalLastChangedAt,

      /*associations*/

      _Travel,
      _Customer,
      _Carrier,
      _Connection,
      _Flight,
      _Currency

}
