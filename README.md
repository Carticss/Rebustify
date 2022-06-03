# Rebustify

Used the audioboom API as a data repository, fetched it with the DIO library for flutter, implemented a lite version of BLoC architecture, BloC architecture modifies components from a Bussines logic that uses data from a state that changes from certain events, since our components don't have states (at least from the BLoC point of view), we can skip the state and event part, and focus on the bussines logic, first we fetch the data from the repo, then we filter the data that we fetch from the api on the BLoC component, then we use that data as we please.

In the home page i implemented a scrollController to handle the data as you scroll down, si it doesn't load all the data at once, then i manage the fetching of data with the BLoC, so that when you scroll down it fetches more data from the server.
