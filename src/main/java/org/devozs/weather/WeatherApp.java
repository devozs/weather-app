package org.devozs.weather;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

public class WeatherApp
{
    private static Logger logger = LoggerFactory.getLogger(WeatherApp.class);
    public static void main( String[] args ) throws IOException {

        TimerTask task = new TimerTask() {
            public void run() {
                logger.info(String.format("Task performed on: %s, Thread's name: %S", new Date(), Thread.currentThread().getName()));
                logger.info("Getting Weather...");
                URL url = null;
                try {
                    url = new URL("https://www.7timer.info/bin/astro.php?lon=113.2&lat=23.1&ac=0&unit=metric&output=json&tzshift=0");
                    HttpURLConnection http = (HttpURLConnection)url.openConnection();
                    http.setRequestProperty("Accept", "application/json");
                    logger.info(String.format("Response Code: %s",http.getResponseCode()));
                    http.disconnect();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        };
        Timer timer = new Timer("Timer");
        timer.schedule(task, 3000, 9000);
    }
}