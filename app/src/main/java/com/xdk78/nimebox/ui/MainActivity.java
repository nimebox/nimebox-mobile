package com.xdk78.nimebox.ui;

import android.os.Bundle;
import android.support.v4.app.FragmentManager;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;

import com.mikepenz.materialdrawer.AccountHeader;
import com.mikepenz.materialdrawer.AccountHeaderBuilder;
import com.mikepenz.materialdrawer.Drawer;
import com.mikepenz.materialdrawer.DrawerBuilder;
import com.mikepenz.materialdrawer.model.PrimaryDrawerItem;
import com.mikepenz.materialdrawer.model.SectionDrawerItem;
import com.xdk78.nimebox.R;

import butterknife.ButterKnife;

public class MainActivity extends AppCompatActivity {

    private AccountHeader headerResult;
    private Drawer result;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        ButterKnife.bind(this);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        MainFragment mainFragment = new MainFragment();
        FragmentManager manager = getSupportFragmentManager();
        manager.beginTransaction().replace(
                R.id.content_main,
                mainFragment
        ).commit();

        new DrawerBuilder().withActivity(this).build();

        headerResult = new AccountHeaderBuilder()
                .withActivity(this)
                .withHeaderBackground(R.drawable.side_nav_bar)
                .build();

        result = new DrawerBuilder()
                .withActivity(this)
                .withToolbar(toolbar)
                .withHasStableIds(true)
                .withActionBarDrawerToggle(true)
                .withActionBarDrawerToggleAnimated(true)
                .withAccountHeader(headerResult)
                .addDrawerItems(
                        new SectionDrawerItem()
                                .withIdentifier(0).withName(R.string.drawer_item_senpai),
                        new PrimaryDrawerItem()
                                .withIdentifier(1).withName(R.string.drawer_item_main),
                        new PrimaryDrawerItem()
                                .withIdentifier(2).withName(R.string.drawer_item_anime),
                        new PrimaryDrawerItem()
                                .withIdentifier(3).withName(R.string.drawer_item_manga),
                        new PrimaryDrawerItem()
                                .withIdentifier(99).withName(R.string.action_settings)

                )
                .withOnDrawerItemClickListener((view, position, drawerItem) -> {

                    if (drawerItem != null) {

                        if (drawerItem.getIdentifier() == 1) {
                            MainFragment mainFragment1 = new MainFragment();
                            FragmentManager manager1 = getSupportFragmentManager();
                            manager1.beginTransaction().replace(
                                    R.id.content_main,
                                    mainFragment1
                            ).commit();
                        } else if (drawerItem.getIdentifier() == 2) {
                            AnimeListFragment animeListFragment = new AnimeListFragment();
                            FragmentManager manager1 = getSupportFragmentManager();
                            manager1.beginTransaction().replace(
                                    R.id.content_main,
                                    animeListFragment
                            ).commit();

                        } else if (drawerItem.getIdentifier() == 3) {
                            MangaListFragment mangaListFragment = new MangaListFragment();
                            FragmentManager manager1 = getSupportFragmentManager();
                            manager1.beginTransaction().replace(
                                    R.id.content_main,
                                    mangaListFragment
                            ).commit();
                        } else if (drawerItem.getIdentifier() == 99) {
                            return false;
                        }

                    }

                    return false;
                })
                .withSavedInstance(savedInstanceState)
                .withShowDrawerOnFirstLaunch(true)
                .build();
    }

    @Override
    protected void onSaveInstanceState(Bundle outState) {
        outState = result.saveInstanceState(outState);
        outState = headerResult.saveInstanceState(outState);
        super.onSaveInstanceState(outState);
    }

    @Override
    public void onBackPressed() {
        if (result != null && result.isDrawerOpen()) {
            result.closeDrawer();
        } else {
            super.onBackPressed();
        }
    }
}