package com.statistics.service.app.controllers;

import com.statistics.service.app.services.GetDataServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping
public class AllDataController {

    @Autowired
    private GetDataServices dataServices;

    @GetMapping("/statistic-data")
    public ModelAndView statisticData(Model model) {
        String gpsData = dataServices.getAllDataByDataType("GPS_SENSOR");
        String lightData = dataServices.getAllDataByDataType("LIGHT_SENSOR");
        String accelerometerData = dataServices.getAllDataByDataType("ACCELEROMETER_SENSOR");

        model.addAttribute("points", gpsData);
        model.addAttribute("lights", lightData);
        model.addAttribute("accelerometer", accelerometerData);

        return new ModelAndView("allAccounts");
    }
}
