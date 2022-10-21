abstract class Endpoints {
  
  static const topHeadlines = "https://newsapi.org/v2/top-headlines?language=en&q={query}&sources={sources}&sortBy={sortBy}&pageSize={pageSize}&page={page}&apiKey={apiKey}";
  // static const topHeadlines = "https://newsapi.org/v2/top-headlines?language=en&q={query}&sources={sources}&country={country}&category={category}&sortBy={sortBy}&pageSize={pageSize}&page={page}&apiKey={apiKey}";
  static const everything = "https://newsapi.org/v2/everything?language=en&q={query}&searchIn=title&sources={sources}&from={fromDate}&to={toDate}&sortBy={sortBy}&pageSize={pageSize}&page={page}&apiKey={apiKey}";

}