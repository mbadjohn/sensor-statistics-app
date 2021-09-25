package com.statistics.service.app.models;

import java.util.Date;

public class AccelerometerDto extends testDTO{
    private Float height;
    private Date created_at;

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Float getHeight() {
        return height;
    }

    public void setHeight(Float height) {
        this.height = height;
    }
}
