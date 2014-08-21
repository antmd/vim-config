// 
// catch.cpp
// 
// Created by Anthony Dervish on 2014-08-21
// Copyright (c) 2014 Dervish Software. All rights reserved.
// 

#define CATCH_CONFIG_RUNNER
#include "catch.hpp"

#include <iostream>
#include <vector>
#include <string>

using namespace std;

//--------------------------------------------------------------------------------
// Class Definitions
//--------------------------------------------------------------------------------


//--------------------------------------------------------------------------------
// Test Cases
//--------------------------------------------------------------------------------

TEST_CASE("All Tests", "[all]") {
    // Code here gets executed for every section

    SECTION("test1", "") {
        // REQUIRE( <SomethingTrue> );

        SECTION("test1-a", "Testing again") {
            // REQUIRE( <SomethingTrue> );
        }
    }
    SECTION("test2", "") {
        // REQUIRE( <SomethingTrue> );
    }
}

/*{{{ SETUP */
int main(int argc, char* const argv[]) {
    Catch::ConfigData catchConfig;
    catchConfig.showSuccessfulTests = true;
    Catch::Session catchSession;
    catchSession.useConfigData(catchConfig);
/*}}}*/

//--------------------------------------------------------------------------------
// Pre-set up ('main')
//--------------------------------------------------------------------------------

cout << "Starting <+FILE NAME ROOT+>" << endl;

<+CURSOR+>

/*{{{ RUN */

    return catchSession.run(argc, argv);
}

// vim:foldmethod=marker:foldlevel=0
/*}}}*/
