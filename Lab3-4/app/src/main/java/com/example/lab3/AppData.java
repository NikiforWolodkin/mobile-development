package com.example.lab3;

import android.content.Context;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

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

    public static List<AppData> readListFromJsonFile(Context context, String fileName) {
        Gson gson = new Gson();
        String filePath = new File(context.getFilesDir(), fileName).getAbsolutePath();
        List<AppData> appDataList = new ArrayList<>();

        try (FileReader reader = new FileReader(filePath)) {
            Type listType = new TypeToken<ArrayList<AppData>>(){}.getType();
            appDataList = gson.fromJson(reader, listType);
        } catch (FileNotFoundException e) {
            // File doesn't exist, return an empty list
            return appDataList;
        } catch (IOException e) {
            e.printStackTrace();
        }

        if (appDataList == null) {
            // In case the file is empty, return an empty list
            return new ArrayList<>();
        }

        return appDataList;
    }

    public static void writeListToJsonFile(Context context, String fileName, List<AppData> appDataList) {
        Gson gson = new Gson();
        String filePath = new File(context.getFilesDir(), fileName).getAbsolutePath();

        try (FileWriter writer = new FileWriter(filePath)) {
            gson.toJson(appDataList, writer);
        } catch (IOException e) {
            e.printStackTrace();
        }
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
