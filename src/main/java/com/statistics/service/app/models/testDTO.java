package com.statistics.service.app.models;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.io.Serializable;
import java.util.List;

public class testDTO implements Serializable {

    private List<testDTO> testDTOItemList;

    public List<testDTO> getTestDTOItemList() {
        return testDTOItemList;
    }


    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Float latitude;
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Float longitude;

    public Float getLatitude() {
        return latitude;
    }

    public void setLatitude(Float latitude) {
        this.latitude = latitude;
    }

    public Float getLongitude() {
        return longitude;
    }

    public void setLongitude(Float longitude) {
        this.longitude = longitude;
    }
}