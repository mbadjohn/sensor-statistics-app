package com.statistics.service.app.models;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.LastModifiedDate;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SensorDataItem implements Serializable {

    private List<SensorDataItem> sensorDataItemList;

    public List<SensorDataItem> getSensorDataItemList() {
        return sensorDataItemList;
    }

    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Long id;
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Float latitude;
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Float longitude;
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Float altitude;
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Float bearing;
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Float speed;
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Float height;
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Float light;
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Float pressure;
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Float proximity;
    @JsonInclude()
    private String username;
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String dataType;
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String fullAddress;
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String admin;
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String subadmin;
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String locality;
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String thoroughfare;
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String postalCode;
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String countryCode;
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String countryName;
    @CreatedDate
    private Date created_at;
    @LastModifiedDate
    private Date updated_at;

    public Long getId() {
        return id;
    }

    public Float getPressure() {
        return pressure;
    }

    public void setPressure(Float pressure) {
        this.pressure = pressure;
    }

    public Float getAltitude() {
        return altitude;
    }

    public void setAltitude(Float altitude) {
        this.altitude = altitude;
    }

    public Float getBearing() {
        return bearing;
    }

    public void setBearing(Float bearing) {
        this.bearing = bearing;
    }

    public Float getSpeed() {
        return speed;
    }

    public void setSpeed(Float speed) {
        this.speed = speed;
    }

    public Float getLight() {
        return light;
    }

    public void setLight(Float light) {
        this.light = light;
    }

    public Float getHeight() {
        return height;
    }

    public void setHeight(Float height) {
        this.height = height;
    }

    public void setId(Long id) {
        this.id = id;
    }

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

    public Float getProximity() { return proximity; }

    public void setProximity(Float proximity) { this.proximity = proximity; }

    public String getUsername() { return username; }

    public void setUsername(String username) { this.username = username; }

    public String getDataType() {
        return dataType;
    }

    public void setDataType(String dataType) {
        this.dataType = dataType;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }

    public String getFullAddress() {
        return fullAddress;
    }

    public void setFullAddress(String fullAddress) {
        this.fullAddress = fullAddress;
    }

    public String getAdmin() {
        return admin;
    }

    public void setAdmin(String admin) {
        this.admin = admin;
    }

    public String getSubadmin() {
        return subadmin;
    }

    public void setSubadmin(String subadmin) {
        this.subadmin = subadmin;
    }

    public String getLocality() {
        return locality;
    }

    public void setLocality(String locality) {
        this.locality = locality;
    }

    public String getThoroughfare() {
        return thoroughfare;
    }

    public void setThoroughfare(String thoroughfare) {
        this.thoroughfare = thoroughfare;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public String getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }
}
