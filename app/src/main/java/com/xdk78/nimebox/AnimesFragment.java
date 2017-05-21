package com.xdk78.nimebox;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import butterknife.ButterKnife;

public class AnimesFragment extends Fragment {

    public View view;

    public AnimesFragment() {
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        view = inflater.inflate(R.layout.fragment_animes, container, false);
        ButterKnife.bind(this, view);
        new AnimesJsoupParser(getContext(), view).execute();
        return view;
    }

}
