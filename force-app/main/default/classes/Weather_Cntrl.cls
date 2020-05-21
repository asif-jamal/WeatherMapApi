public class Weather_Cntrl {
    
    
    
    @AuraEnabled
    public static fromJSON findWeather(String cityName){
        
        
        String key='484de43b030a90f36ad0f515c744eafd';
        String endpoint='https://api.openweathermap.org/data/2.5/weather?q=' +cityName.replace(' ','%20')+ '&appid=' + key+'&units=metric';
        
        
        Http http=new Http();
        HttpRequest request =new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        
        HttpResponse response=new HttpResponse();
        response=http.send(request);
        String json = response.getBody();
        
        fromJSON weatherdata =(fromJSON) System.JSON.deserialize(json, fromJSON.class);
        
        Map<String, Object> mapdata =(Map<String, Object>)System.JSON.deserializeUntyped(json);

        
        return weatherdata;
    }
    
    @AuraEnabled
    public static Map<String, Object> ForeCastWeather(String cityName){
        String key='484de43b030a90f36ad0f515c744eafd';
        String endpoint='https://api.openweathermap.org/data/2.5/forecast?q=' +cityName.replace(' ','%20')+ '&appid=' + key+'&units=metric';
        
        
        Http http=new Http();
        HttpRequest request =new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        
        HttpResponse response=new HttpResponse();
        response=http.send(request);
        String json = response.getBody();
        Map<String, Object> weatherData =(Map<String, Object>)System.JSON.deserializeUntyped(json);
	//	dailydataList = weatherdata.get('list');
        
       /* For(String obj : dailydataList)
        {
           System.debug('Value '+obj); 
        }*/
        return weatherData;
    }
    
    // wrapper class
    
    public class fromJSON{
        @AuraEnabled  public Wrpcoord coord;
        @AuraEnabled  public Wrpweather[] weather;
        @AuraEnabled  public String base;	
        @AuraEnabled  public Wrpmain main;
        @AuraEnabled  public Integer visibility;
        @AuraEnabled  public Wrpwind wind;
        @AuraEnabled  public WrpClouds clouds;
        @AuraEnabled  public Integer dt;	
        @AuraEnabled  public WrpCountry sys;
        @AuraEnabled  public Integer timezone;	
        @AuraEnabled  public Integer id;	
        @AuraEnabled  public String name;	
        @AuraEnabled  public Integer cod;	
    }
    class Wrpcoord {
        @AuraEnabled  public Double lon;	
        @AuraEnabled  public Double lat;	
    }
    class Wrpweather {
        @AuraEnabled  public Integer id;	
        @AuraEnabled  public String main;	
        @AuraEnabled  public String description;	
        @AuraEnabled  public String icon;	
    }
    class Wrpmain {
        @AuraEnabled  public Double temp;	
        @AuraEnabled  public Double feels_like;	
        @AuraEnabled  public Double temp_min;	
        @AuraEnabled  public Double temp_max;	
        @AuraEnabled public Integer pressure;	
        @AuraEnabled public Integer humidity;	
    }
    class Wrpwind {
        @AuraEnabled  public Double speed;	
        @AuraEnabled  public Integer deg;	
    }
    class WrpClouds {
        @AuraEnabled  public Integer all;	
    }
    class WrpCountry {
        @AuraEnabled  public Integer type;	
        @AuraEnabled  public Integer id;	
        @AuraEnabled  public String country;	
        @AuraEnabled  public Integer sunrise;	
        @AuraEnabled  public Integer sunset;	
    }
    public static void dailyData(){
        
        
    }
    
}