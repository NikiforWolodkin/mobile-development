package com.example.lab3;

import android.content.Context;

import com.google.gson.Gson;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class AppData {
    public String Name;
    public String Version;
    public String Language;
    public String Framework;
    public String ReleaseDate;
    public String License;
    public boolean IsOpenSource;

    // Method to write AppData object to a file as JSON
    public void writeToJsonFile(Context context, String fileName) {
        Gson gson = new Gson();
        String filePath = new File(context.getFilesDir(), fileName).getAbsolutePath();
        try (FileWriter writer = new FileWriter(filePath)) {
            gson.toJson(this, writer);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Method to read AppData object from a JSON file
    public static AppData readFromJsonFile(Context context, String fileName) {
        Gson gson = new Gson();
        String filePath = new File(context.getFilesDir(), fileName).getAbsolutePath();
        try (FileReader reader = new FileReader(filePath)) {
            return gson.fromJson(reader, AppData.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public String toString() {
        return "AppData {" +
                "\n\tName = '" + Name + '\'' +
                ",\n\tVersion = '" + Version + '\'' +
                ",\n\tLanguage = '" + Language + '\'' +
                ",\n\tFramework = '" + Framework + '\'' +
                ",\n\tReleaseDate = '" + ReleaseDate + '\'' +
                ",\n\tLicense = '" + License + '\'' +
                ",\n\tIsOpenSource = " + IsOpenSource +
                "\n}";
    }
}
