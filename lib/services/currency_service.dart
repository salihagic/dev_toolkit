import 'package:dev_toolkit/dev_toolkit.dart';

abstract class CurrencyService {
  Currency getCurrencyByCodeOrDefault([String? code]);
  String formatWithCurrency(double value,
      [Currency? curr,
      int numberOfDecimals = 2,
      bool ignoreDecimalIfZero = true]);
  String formatWithCurrencyCode(double value, [String currencyCode = 'EUR']);
}

class CurrencyServiceImpl implements CurrencyService {
  @override
  Currency getCurrencyByCodeOrDefault([String? code]) =>
      _currencySymbols[code ?? DevToolkit.currencyCode] ??
      Currency(
          symbol: '€',
          code: 'EUR',
          symbolPosition: CurrencySymbolPosition.sufix);

  @override
  String formatWithCurrency(double value,
      [Currency? curr,
      int numberOfDecimals = 2,
      bool ignoreDecimalIfZero = true]) {
    final currency = curr ?? getCurrencyByCodeOrDefault();

    return '${currency.symbolPosition.isBefore ? currency.symbol : ''}${value.format(numberOfDecimals, ignoreDecimalIfZero)}${currency.symbolPosition.isAfter ? ' ${currency.symbol}' : ''}';
  }

  @override
  String formatWithCurrencyCode(double value, [String currencyCode = 'EUR']) =>
      '$currencyCode ${value.format()}';

  final _currencySymbols = {
    'AED': Currency(
        symbol: 'د.إ',
        code: 'AED',
        symbolPosition: CurrencySymbolPosition.sufix),
    'AFN': Currency(
        symbol: '؋', code: 'AFN', symbolPosition: CurrencySymbolPosition.sufix),
    'ALL': Currency(
        symbol: 'L', code: 'ALL', symbolPosition: CurrencySymbolPosition.sufix),
    'AMD': Currency(
        symbol: '֏', code: 'AMD', symbolPosition: CurrencySymbolPosition.sufix),
    'ANG': Currency(
        symbol: 'ƒ', code: 'ANG', symbolPosition: CurrencySymbolPosition.sufix),
    'AOA': Currency(
        symbol: 'Kz',
        code: 'AOA',
        symbolPosition: CurrencySymbolPosition.sufix),
    'ARS': Currency(
        symbol: '\$',
        code: 'ARS',
        symbolPosition: CurrencySymbolPosition.prefix),
    'AUD': Currency(
        symbol: '\$',
        code: 'AUD',
        symbolPosition: CurrencySymbolPosition.prefix),
    'AWG': Currency(
        symbol: 'ƒ', code: 'AWG', symbolPosition: CurrencySymbolPosition.sufix),
    'AZN': Currency(
        symbol: '₼', code: 'AZN', symbolPosition: CurrencySymbolPosition.sufix),
    'BAM': Currency(
        symbol: 'КМ',
        code: 'BAM',
        symbolPosition: CurrencySymbolPosition.sufix),
    'BBD': Currency(
        symbol: '\$',
        code: 'BBD',
        symbolPosition: CurrencySymbolPosition.prefix),
    'BDT': Currency(
        symbol: '৳', code: 'BDT', symbolPosition: CurrencySymbolPosition.sufix),
    'BGN': Currency(
        symbol: 'лв',
        code: 'BGN',
        symbolPosition: CurrencySymbolPosition.sufix),
    'BHD': Currency(
        symbol: '.د.ب',
        code: 'BHD',
        symbolPosition: CurrencySymbolPosition.sufix),
    'BIF': Currency(
        symbol: 'FBu',
        code: 'BIF',
        symbolPosition: CurrencySymbolPosition.sufix),
    'BMD': Currency(
        symbol: '\$',
        code: 'BMD',
        symbolPosition: CurrencySymbolPosition.prefix),
    'BND': Currency(
        symbol: '\$',
        code: 'BND',
        symbolPosition: CurrencySymbolPosition.prefix),
    'BOB': Currency(
        symbol: 'Bs.',
        code: 'BOB',
        symbolPosition: CurrencySymbolPosition.sufix),
    'BRL': Currency(
        symbol: 'R\$',
        code: 'BRL',
        symbolPosition: CurrencySymbolPosition.sufix),
    'BSD': Currency(
        symbol: '\$',
        code: 'BSD',
        symbolPosition: CurrencySymbolPosition.prefix),
    'BTN': Currency(
        symbol: 'Nu.',
        code: 'BTN',
        symbolPosition: CurrencySymbolPosition.sufix),
    'BWP': Currency(
        symbol: 'P', code: 'BWP', symbolPosition: CurrencySymbolPosition.sufix),
    'BYN': Currency(
        symbol: 'Br',
        code: 'BYN',
        symbolPosition: CurrencySymbolPosition.sufix),
    'BZD': Currency(
        symbol: 'BZ\$',
        code: 'BZD',
        symbolPosition: CurrencySymbolPosition.sufix),
    'CAD': Currency(
        symbol: '\$',
        code: 'CAD',
        symbolPosition: CurrencySymbolPosition.prefix),
    'CDF': Currency(
        symbol: 'FC',
        code: 'CDF',
        symbolPosition: CurrencySymbolPosition.sufix),
    'CHF': Currency(
        symbol: 'CHF',
        code: 'CHF',
        symbolPosition: CurrencySymbolPosition.sufix),
    'CLP': Currency(
        symbol: '\$',
        code: 'CLP',
        symbolPosition: CurrencySymbolPosition.prefix),
    'CNY': Currency(
        symbol: '¥', code: 'CNY', symbolPosition: CurrencySymbolPosition.sufix),
    'COP': Currency(
        symbol: '\$',
        code: 'COP',
        symbolPosition: CurrencySymbolPosition.prefix),
    'CRC': Currency(
        symbol: '₡', code: 'CRC', symbolPosition: CurrencySymbolPosition.sufix),
    'CUP': Currency(
        symbol: '\$MN',
        code: 'CUP',
        symbolPosition: CurrencySymbolPosition.sufix),
    'CVE': Currency(
        symbol: '\$',
        code: 'CVE',
        symbolPosition: CurrencySymbolPosition.prefix),
    'CZK': Currency(
        symbol: 'Kč',
        code: 'CZK',
        symbolPosition: CurrencySymbolPosition.sufix),
    'DJF': Currency(
        symbol: 'Fdj',
        code: 'DJF',
        symbolPosition: CurrencySymbolPosition.sufix),
    'DKK': Currency(
        symbol: 'kr',
        code: 'DKK',
        symbolPosition: CurrencySymbolPosition.sufix),
    'DOP': Currency(
        symbol: 'RD\$',
        code: 'DOP',
        symbolPosition: CurrencySymbolPosition.sufix),
    'DZD': Currency(
        symbol: 'دج',
        code: 'DZD',
        symbolPosition: CurrencySymbolPosition.sufix),
    'EGP': Currency(
        symbol: 'ج.م',
        code: 'EGP',
        symbolPosition: CurrencySymbolPosition.sufix),
    'ERN': Currency(
        symbol: 'Nfk',
        code: 'ERN',
        symbolPosition: CurrencySymbolPosition.sufix),
    'ETB': Currency(
        symbol: 'Br',
        code: 'ETB',
        symbolPosition: CurrencySymbolPosition.sufix),
    'EUR': Currency(
        symbol: '€', code: 'EUR', symbolPosition: CurrencySymbolPosition.sufix),
    'FJD': Currency(
        symbol: '\$',
        code: 'FJD',
        symbolPosition: CurrencySymbolPosition.prefix),
    'FKP': Currency(
        symbol: '£', code: 'FKP', symbolPosition: CurrencySymbolPosition.sufix),
    'FOK': Currency(
        symbol: 'kr',
        code: 'FOK',
        symbolPosition: CurrencySymbolPosition.sufix),
    'GBP': Currency(
        symbol: '£', code: 'GBP', symbolPosition: CurrencySymbolPosition.sufix),
    'GEL': Currency(
        symbol: 'ლ', code: 'GEL', symbolPosition: CurrencySymbolPosition.sufix),
    'GGP': Currency(
        symbol: '£', code: 'GGP', symbolPosition: CurrencySymbolPosition.sufix),
    'GHS': Currency(
        symbol: '₵', code: 'GHS', symbolPosition: CurrencySymbolPosition.sufix),
    'GIP': Currency(
        symbol: '£', code: 'GIP', symbolPosition: CurrencySymbolPosition.sufix),
    'GMD': Currency(
        symbol: 'D', code: 'GMD', symbolPosition: CurrencySymbolPosition.sufix),
    'GNF': Currency(
        symbol: 'FG',
        code: 'GNF',
        symbolPosition: CurrencySymbolPosition.sufix),
    'GTQ': Currency(
        symbol: 'Q', code: 'GTQ', symbolPosition: CurrencySymbolPosition.sufix),
    'GYD': Currency(
        symbol: '\$',
        code: 'GYD',
        symbolPosition: CurrencySymbolPosition.prefix),
    'HKD': Currency(
        symbol: 'HK\$',
        code: 'HKD',
        symbolPosition: CurrencySymbolPosition.sufix),
    'HNL': Currency(
        symbol: 'L', code: 'HNL', symbolPosition: CurrencySymbolPosition.sufix),
    'HRK': Currency(
        symbol: 'kn',
        code: 'HRK',
        symbolPosition: CurrencySymbolPosition.sufix),
    'HTG': Currency(
        symbol: 'G', code: 'HTG', symbolPosition: CurrencySymbolPosition.sufix),
    'HUF': Currency(
        symbol: 'Ft',
        code: 'HUF',
        symbolPosition: CurrencySymbolPosition.sufix),
    'IDR': Currency(
        symbol: 'Rp',
        code: 'IDR',
        symbolPosition: CurrencySymbolPosition.sufix),
    'ILS': Currency(
        symbol: '₪', code: 'ILS', symbolPosition: CurrencySymbolPosition.sufix),
    'IMP': Currency(
        symbol: '£', code: 'IMP', symbolPosition: CurrencySymbolPosition.sufix),
    'INR': Currency(
        symbol: '₹', code: 'INR', symbolPosition: CurrencySymbolPosition.sufix),
    'IQD': Currency(
        symbol: 'ع.د',
        code: 'IQD',
        symbolPosition: CurrencySymbolPosition.sufix),
    'IRR': Currency(
        symbol: '﷼', code: 'IRR', symbolPosition: CurrencySymbolPosition.sufix),
    'ISK': Currency(
        symbol: 'kr',
        code: 'ISK',
        symbolPosition: CurrencySymbolPosition.sufix),
    'JEP': Currency(
        symbol: '£', code: 'JEP', symbolPosition: CurrencySymbolPosition.sufix),
    'JMD': Currency(
        symbol: 'J\$',
        code: 'JMD',
        symbolPosition: CurrencySymbolPosition.sufix),
    'JOD': Currency(
        symbol: 'د.ا',
        code: 'JOD',
        symbolPosition: CurrencySymbolPosition.sufix),
    'JPY': Currency(
        symbol: '¥', code: 'JPY', symbolPosition: CurrencySymbolPosition.sufix),
    'KES': Currency(
        symbol: 'KSh',
        code: 'KES',
        symbolPosition: CurrencySymbolPosition.sufix),
    'KGS': Currency(
        symbol: 'с', code: 'KGS', symbolPosition: CurrencySymbolPosition.sufix),
    'KHR': Currency(
        symbol: '៛', code: 'KHR', symbolPosition: CurrencySymbolPosition.sufix),
    'KID': Currency(
        symbol: '\$',
        code: 'KID',
        symbolPosition: CurrencySymbolPosition.prefix),
    'KMF': Currency(
        symbol: 'CF',
        code: 'KMF',
        symbolPosition: CurrencySymbolPosition.sufix),
    'KRW': Currency(
        symbol: '₩', code: 'KRW', symbolPosition: CurrencySymbolPosition.sufix),
    'KWD': Currency(
        symbol: 'د.ك',
        code: 'KWD',
        symbolPosition: CurrencySymbolPosition.sufix),
    'KYD': Currency(
        symbol: '\$',
        code: 'KYD',
        symbolPosition: CurrencySymbolPosition.prefix),
    'KZT': Currency(
        symbol: '₸', code: 'KZT', symbolPosition: CurrencySymbolPosition.sufix),
    'LAK': Currency(
        symbol: '₭', code: 'LAK', symbolPosition: CurrencySymbolPosition.sufix),
    'LBP': Currency(
        symbol: 'ل.ل',
        code: 'LBP',
        symbolPosition: CurrencySymbolPosition.sufix),
    'LKR': Currency(
        symbol: 'Rs',
        code: 'LKR',
        symbolPosition: CurrencySymbolPosition.sufix),
    'LRD': Currency(
        symbol: '\$',
        code: 'LRD',
        symbolPosition: CurrencySymbolPosition.prefix),
    'LSL': Currency(
        symbol: 'M', code: 'LSL', symbolPosition: CurrencySymbolPosition.sufix),
    'LYD': Currency(
        symbol: 'ل.د',
        code: 'LYD',
        symbolPosition: CurrencySymbolPosition.sufix),
    'MAD': Currency(
        symbol: 'د.م.',
        code: 'MAD',
        symbolPosition: CurrencySymbolPosition.sufix),
    'MDL': Currency(
        symbol: 'L', code: 'MDL', symbolPosition: CurrencySymbolPosition.sufix),
    'MGA': Currency(
        symbol: 'Ar',
        code: 'MGA',
        symbolPosition: CurrencySymbolPosition.sufix),
    'MKD': Currency(
        symbol: 'ден',
        code: 'MKD',
        symbolPosition: CurrencySymbolPosition.sufix),
    'MMK': Currency(
        symbol: 'Ks',
        code: 'MMK',
        symbolPosition: CurrencySymbolPosition.sufix),
    'MNT': Currency(
        symbol: '₮', code: 'MNT', symbolPosition: CurrencySymbolPosition.sufix),
    'MOP': Currency(
        symbol: 'MOP\$',
        code: 'MOP',
        symbolPosition: CurrencySymbolPosition.sufix),
    'MRU': Currency(
        symbol: 'UM',
        code: 'MRU',
        symbolPosition: CurrencySymbolPosition.sufix),
    'MUR': Currency(
        symbol: 'Rs',
        code: 'MUR',
        symbolPosition: CurrencySymbolPosition.sufix),
    'MVR': Currency(
        symbol: 'Rf',
        code: 'MVR',
        symbolPosition: CurrencySymbolPosition.sufix),
    'MWK': Currency(
        symbol: 'MK',
        code: 'MWK',
        symbolPosition: CurrencySymbolPosition.sufix),
    'MXN': Currency(
        symbol: '\$',
        code: 'MXN',
        symbolPosition: CurrencySymbolPosition.prefix),
    'MYR': Currency(
        symbol: 'RM',
        code: 'MYR',
        symbolPosition: CurrencySymbolPosition.sufix),
    'MZN': Currency(
        symbol: 'MT',
        code: 'MZN',
        symbolPosition: CurrencySymbolPosition.sufix),
    'NAD': Currency(
        symbol: '\$',
        code: 'NAD',
        symbolPosition: CurrencySymbolPosition.prefix),
    'NGN': Currency(
        symbol: '₦', code: 'NGN', symbolPosition: CurrencySymbolPosition.sufix),
    'NIO': Currency(
        symbol: 'C\$',
        code: 'NIO',
        symbolPosition: CurrencySymbolPosition.sufix),
    'NOK': Currency(
        symbol: 'kr',
        code: 'NOK',
        symbolPosition: CurrencySymbolPosition.sufix),
    'NPR': Currency(
        symbol: 'Rs',
        code: 'NPR',
        symbolPosition: CurrencySymbolPosition.sufix),
    'NZD': Currency(
        symbol: '\$',
        code: 'NZD',
        symbolPosition: CurrencySymbolPosition.prefix),
    'OMR': Currency(
        symbol: 'ر.ع.',
        code: 'OMR',
        symbolPosition: CurrencySymbolPosition.sufix),
    'PAB': Currency(
        symbol: 'B/.',
        code: 'PAB',
        symbolPosition: CurrencySymbolPosition.sufix),
    'PEN': Currency(
        symbol: 'S/',
        code: 'PEN',
        symbolPosition: CurrencySymbolPosition.sufix),
    'PGK': Currency(
        symbol: 'K', code: 'PGK', symbolPosition: CurrencySymbolPosition.sufix),
    'PHP': Currency(
        symbol: '₱', code: 'PHP', symbolPosition: CurrencySymbolPosition.sufix),
    'PKR': Currency(
        symbol: 'Rs',
        code: 'PKR',
        symbolPosition: CurrencySymbolPosition.sufix),
    'PLN': Currency(
        symbol: 'zł',
        code: 'PLN',
        symbolPosition: CurrencySymbolPosition.sufix),
    'PYG': Currency(
        symbol: '₲', code: 'PYG', symbolPosition: CurrencySymbolPosition.sufix),
    'QAR': Currency(
        symbol: 'ر.ق',
        code: 'QAR',
        symbolPosition: CurrencySymbolPosition.sufix),
    'RON': Currency(
        symbol: 'lei',
        code: 'RON',
        symbolPosition: CurrencySymbolPosition.sufix),
    'RSD': Currency(
        symbol: 'дин',
        code: 'RSD',
        symbolPosition: CurrencySymbolPosition.sufix),
    'RUB': Currency(
        symbol: '₽', code: 'RUB', symbolPosition: CurrencySymbolPosition.sufix),
    'RWF': Currency(
        symbol: 'FRw',
        code: 'RWF',
        symbolPosition: CurrencySymbolPosition.sufix),
    'SAR': Currency(
        symbol: 'ر.س',
        code: 'SAR',
        symbolPosition: CurrencySymbolPosition.sufix),
    'SBD': Currency(
        symbol: '\$',
        code: 'SBD',
        symbolPosition: CurrencySymbolPosition.prefix),
    'SCR': Currency(
        symbol: 'Rs',
        code: 'SCR',
        symbolPosition: CurrencySymbolPosition.sufix),
    'SDG': Currency(
        symbol: 'ج.س.',
        code: 'SDG',
        symbolPosition: CurrencySymbolPosition.sufix),
    'SEK': Currency(
        symbol: 'kr',
        code: 'SEK',
        symbolPosition: CurrencySymbolPosition.sufix),
    'SGD': Currency(
        symbol: '\$',
        code: 'SGD',
        symbolPosition: CurrencySymbolPosition.prefix),
    'SHP': Currency(
        symbol: '£', code: 'SHP', symbolPosition: CurrencySymbolPosition.sufix),
    'SLL': Currency(
        symbol: 'Le',
        code: 'SLL',
        symbolPosition: CurrencySymbolPosition.sufix),
    'SOS': Currency(
        symbol: 'S', code: 'SOS', symbolPosition: CurrencySymbolPosition.sufix),
    'SRD': Currency(
        symbol: '\$',
        code: 'SRD',
        symbolPosition: CurrencySymbolPosition.prefix),
    'SSP': Currency(
        symbol: '£', code: 'SSP', symbolPosition: CurrencySymbolPosition.sufix),
    'STN': Currency(
        symbol: 'Db',
        code: 'STN',
        symbolPosition: CurrencySymbolPosition.sufix),
    'SYP': Currency(
        symbol: '£S',
        code: 'SYP',
        symbolPosition: CurrencySymbolPosition.sufix),
    'SZL': Currency(
        symbol: 'L', code: 'SZL', symbolPosition: CurrencySymbolPosition.sufix),
    'THB': Currency(
        symbol: '฿', code: 'THB', symbolPosition: CurrencySymbolPosition.sufix),
    'TJS': Currency(
        symbol: 'SM',
        code: 'TJS',
        symbolPosition: CurrencySymbolPosition.sufix),
    'TMT': Currency(
        symbol: 'T', code: 'TMT', symbolPosition: CurrencySymbolPosition.sufix),
    'TND': Currency(
        symbol: 'د.ت',
        code: 'TND',
        symbolPosition: CurrencySymbolPosition.sufix),
    'TOP': Currency(
        symbol: 'T\$',
        code: 'TOP',
        symbolPosition: CurrencySymbolPosition.sufix),
    'TRY': Currency(
        symbol: '₺', code: 'TRY', symbolPosition: CurrencySymbolPosition.sufix),
    'TTD': Currency(
        symbol: 'TT\$',
        code: 'TTD',
        symbolPosition: CurrencySymbolPosition.sufix),
    'TVD': Currency(
        symbol: '\$',
        code: 'TVD',
        symbolPosition: CurrencySymbolPosition.prefix),
    'TWD': Currency(
        symbol: 'NT\$',
        code: 'TWD',
        symbolPosition: CurrencySymbolPosition.sufix),
    'TZS': Currency(
        symbol: 'TSh',
        code: 'TZS',
        symbolPosition: CurrencySymbolPosition.sufix),
    'UAH': Currency(
        symbol: '₴', code: 'UAH', symbolPosition: CurrencySymbolPosition.sufix),
    'UGX': Currency(
        symbol: 'USh',
        code: 'UGX',
        symbolPosition: CurrencySymbolPosition.sufix),
    'USD': Currency(
        symbol: '\$',
        code: 'USD',
        symbolPosition: CurrencySymbolPosition.prefix),
    'UYU': Currency(
        symbol: '\$U',
        code: 'UYU',
        symbolPosition: CurrencySymbolPosition.sufix),
    'UZS': Currency(
        symbol: 'лв',
        code: 'UZS',
        symbolPosition: CurrencySymbolPosition.sufix),
    'VES': Currency(
        symbol: 'Bs',
        code: 'VES',
        symbolPosition: CurrencySymbolPosition.sufix),
    'VND': Currency(
        symbol: '₫', code: 'VND', symbolPosition: CurrencySymbolPosition.sufix),
    'VUV': Currency(
        symbol: 'VT',
        code: 'VUV',
        symbolPosition: CurrencySymbolPosition.sufix),
    'WST': Currency(
        symbol: 'WS\$',
        code: 'WST',
        symbolPosition: CurrencySymbolPosition.sufix),
    'XAF': Currency(
        symbol: 'FCFA',
        code: 'XAF',
        symbolPosition: CurrencySymbolPosition.sufix),
    'XCD': Currency(
        symbol: 'EC\$',
        code: 'XCD',
        symbolPosition: CurrencySymbolPosition.sufix),
    'XDR': Currency(
        symbol: 'SDR',
        code: 'XDR',
        symbolPosition: CurrencySymbolPosition.sufix),
    'XOF': Currency(
        symbol: 'CFA',
        code: 'XOF',
        symbolPosition: CurrencySymbolPosition.sufix),
    'XPF': Currency(
        symbol: '₣', code: 'XPF', symbolPosition: CurrencySymbolPosition.sufix),
    'YER': Currency(
        symbol: '﷼', code: 'YER', symbolPosition: CurrencySymbolPosition.sufix),
    'ZAR': Currency(
        symbol: 'R', code: 'ZAR', symbolPosition: CurrencySymbolPosition.sufix),
    'ZMW': Currency(
        symbol: 'ZK',
        code: 'ZMW',
        symbolPosition: CurrencySymbolPosition.sufix),
    'ZWD': Currency(
        symbol: 'Z\$',
        code: 'ZWD',
        symbolPosition: CurrencySymbolPosition.sufix),
  };
}

class MockCurrencyServiceImpl implements CurrencyService {
  @override
  Currency getCurrencyByCodeOrDefault([String? code]) => Currency(
      symbol: 'D',
      code: 'DEFALUT',
      symbolPosition: CurrencySymbolPosition.sufix);

  @override
  String formatWithCurrency(double value,
      [Currency? curr,
      int numberOfDecimals = 2,
      bool ignoreDecimalIfZero = true]) {
    final currency = curr ?? getCurrencyByCodeOrDefault();

    return '${currency.symbolPosition.isBefore ? currency.symbol : ''}${value.format(numberOfDecimals, ignoreDecimalIfZero)}${currency.symbolPosition.isAfter ? ' ${currency.symbol}' : ''}';
  }

  @override
  String formatWithCurrencyCode(double value, [String currencyCode = 'EUR']) =>
      '$currencyCode ${value.format()}';
}

enum CurrencySymbolPosition {
  prefix,
  sufix;

  bool get isBefore => this == CurrencySymbolPosition.prefix;
  bool get isAfter => this == CurrencySymbolPosition.sufix;
}

class Currency {
  final String symbol;
  final String code;
  final CurrencySymbolPosition symbolPosition;

  Currency({
    required this.symbol,
    required this.code,
    required this.symbolPosition,
  });
}
