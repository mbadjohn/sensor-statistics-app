package com.statistics.service.app.controllers;
import com.statistics.service.app.services.GetDataServices;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping
public class MapboxController {

    private final Logger LOGGER = Logger.getLogger(this.getClass());

    @Autowired
    private GetDataServices dataServices;

    @GetMapping("/mapbox")
    public ModelAndView createMapbox(Model model) {

        String gpsData = dataServices.getAllUserDataByDataType("GPS_SENSOR", "mkakogiannou@gmail.com");
        String lightData = dataServices.getAllUserDataByDataType("LIGHT_SENSOR", "mkakogiannou@gmail.com");
        String accelerometerData = dataServices.getAllUserDataByDataType("ACCELEROMETER_SENSOR", "mkakogiannou@gmail.com");

        model.addAttribute("points", gpsData);
        model.addAttribute("lights", lightData);
        model.addAttribute("accelerometer", accelerometerData);

        return new ModelAndView("home");

    }
}
