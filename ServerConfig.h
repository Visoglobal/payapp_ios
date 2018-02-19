//server url

//#define cfgServerURL @"http://dev2.ru/payapp/"
//#define cfgServerURL @"http://padev.m4bank.ru/"
#define cfgServerURL @"https://10.31.0.12:8443/payapp/"

#define cfgServerApiURL [NSString stringWithFormat:@"%@/api",cfgServerURL]

//DEBUG
#define REQUESTS_DEBUG 1

#define REQUESTS_DEMO 1


//Api methods
#define kServerApiMethodTransactionList @"TransactionListRequest"
