package com.example.lab3;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import java.util.List;

public class AppDataAdapter extends ArrayAdapter<AppData> {
    private final Context context;
    private final List<AppData> values;

    public AppDataAdapter(Context context, List<AppData> values) {
        super(context, R.layout.list_item, values);
        this.context = context;
        this.values = values;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        View rowView = inflater.inflate(R.layout.list_item, parent, false);

        TextView nameView = (TextView) rowView.findViewById(R.id.name);
        TextView versionView = (TextView) rowView.findViewById(R.id.version);
        // Add more views as needed

        AppData appData = values.get(position);

        nameView.setText(appData.Name);
        versionView.setText(appData.Version);
        // Set more views as needed

        return rowView;
    }
}
