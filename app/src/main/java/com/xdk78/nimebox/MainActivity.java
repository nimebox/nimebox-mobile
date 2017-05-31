package com.xdk78.nimebox;

import android.content.Context;
import android.os.Bundle;
import android.support.v4.app.FragmentManager;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;

import com.mikepenz.materialdrawer.AccountHeader;
import com.mikepenz.materialdrawer.AccountHeaderBuilder;
import com.mikepenz.materialdrawer.Drawer;
import com.mikepenz.materialdrawer.DrawerBuilder;
import com.mikepenz.materialdrawer.model.PrimaryDrawerItem;
import com.mikepenz.materialdrawer.model.interfaces.IDrawerItem;

import butterknife.ButterKnife;

public class MainActivity extends AppCompatActivity {
    private static Context context;
    //save our header or result
    private AccountHeader headerResult;
    private Drawer result;

    public static Context getContext() {
        return context;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        ButterKnife.bind(this);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        context = getApplicationContext();

        MainFragment mainFragment = new MainFragment();
        FragmentManager manager = getSupportFragmentManager();
        manager.beginTransaction().replace(
                R.id.content_main,
                mainFragment
        ).commit();

        new DrawerBuilder().withActivity(this).build();

        // Create the AccountHeader
        headerResult = new AccountHeaderBuilder()
                .withActivity(this)
                .withHeaderBackground(R.drawable.side_nav_bar)
                .build();

        //create the drawer and remember the `Drawer` result object
        result = new DrawerBuilder()
                .withActivity(this)
                .withToolbar(toolbar)
                .withHasStableIds(true)
                .withActionBarDrawerToggle(true)
                .withActionBarDrawerToggleAnimated(true)
                .withAccountHeader(headerResult) //set the AccountHeader we created earlier for the header
                .addDrawerItems(
                        new PrimaryDrawerItem()
                                .withIdentifier(0).withName(R.string.drawer_item_main),
                        new PrimaryDrawerItem()
                                .withIdentifier(1).withName(R.string.drawer_item_animes),
                        new PrimaryDrawerItem()
                                .withIdentifier(2).withName(R.string.action_settings)

                )
                .withOnDrawerItemClickListener(new Drawer.OnDrawerItemClickListener() {
                    @Override
                    public boolean onItemClick(View view, int position, IDrawerItem drawerItem) {
                        //check if the drawerItem is set.
                        //there are different reasons for the drawerItem to be null
                        //--> click on the header
                        //--> click on the footer
                        //those items don't contain a drawerItem

                        if (drawerItem != null) {
                            if (drawerItem.getIdentifier() == 0) {
                                MainFragment mainFragment = new MainFragment();
                                FragmentManager manager = getSupportFragmentManager();
                                manager.beginTransaction().replace(
                                        R.id.content_main,
                                        mainFragment
                                ).commit();
                            }
                            else if (drawerItem.getIdentifier() == 1) {
                                AnimeListFragment animeListFragment = new AnimeListFragment();
                                FragmentManager manager = getSupportFragmentManager();
                                manager.beginTransaction().replace(
                                        R.id.content_main,
                                        animeListFragment
                                ).commit();
                            } else if (drawerItem.getIdentifier() == 2) {
                                return false;
                            }

                        }

                        return false;
                    }
                })
                .withSavedInstance(savedInstanceState)
                .withShowDrawerOnFirstLaunch(true)
                .build();


    }

    @Override
    protected void onSaveInstanceState(Bundle outState) {
        //add the values which need to be saved from the drawer to the bundle
        outState = result.saveInstanceState(outState);
        //add the values which need to be saved from the accountHeader to the bundle
        outState = headerResult.saveInstanceState(outState);
        super.onSaveInstanceState(outState);
    }

    @Override
    public void onBackPressed() {
        //handle the back press :D close the drawer first and if the drawer is closed close the activity
        if (result != null && result.isDrawerOpen()) {
            result.closeDrawer();
        } else {
            super.onBackPressed();
        }
    }

}