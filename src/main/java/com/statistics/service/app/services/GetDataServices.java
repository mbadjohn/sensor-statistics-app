package com.statistics.service.app.services;

import com.google.gson.Gson;
import com.statistics.service.app.models.*;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;


@Service
public class GetDataServices {

    private final Logger LOGGER = Logger.getLogger(this.getClass());

    @Autowired
    private RestTemplate restTemplate;

    public String getAllUserDataByDataType(String data_type, String username) {
        final String uri = "http://crud-webservice/api/v1/data/type/" + data_type + "/" + username;
        System.out.println(data_type);

        SensorDataItem[] data = restTemplate.getForEntity(uri, SensorDataItem[].class).getBody();

        Gson gson = new Gson();
        String json = gson.toJson(data);

        System.out.println(json);

        return json;

    }

    public String getAllDataByDataType(String data_type) {
        final String uri = "http://crud-webservice/api/v1/data/type/" + data_type;

        SensorDataItem[] data = restTemplate.getForEntity(uri, SensorDataItem[].class).getBody();

        Gson gson = new Gson();
        String json = gson.toJson(data);

        System.out.println(json);

        return json;

    }
}
