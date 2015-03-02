# The PublicBodyCategories structure works like this:
# [
#   "Main category name",
#       [ "tag_to_use_as_category", "Sub category title", "sentence that can describes things in this subcategory" ],
#       [ "another_tag", "Second sub category title", "another descriptive sentence for things in this subcategory"],
#   "Another main category name",
#       [ "another_tag_2", "Another sub category title", "another descriptive sentence"]
# ])

PublicBodyCategories.add(:en,
    [ "Federal",
        [ "agriculture", "Agriculture", "part of the Agriculture portfolio" ],
        [ "attorney-general","Attorney-General","part of the Attorney-General portfolio" ],
        [ "communications","Communications","part of the Communications portfolio" ],
        [ "defence","Defence","part of the Defence portfolio" ],
        [ "education_and_training","Education and Training","part of the Education and Training portfolio" ],
        [ "employment","Employment","part of the Employment portfolio" ],
        [ "environment","Environment","part of the Environment portfolio" ],
        [ "finance","Finance","part of the Finance portfolio" ],
        [ "foreign_affairs_and_trade","Foreign Affairs and Trade","part of the Foreign Affairs and Trade portfolio" ],
        [ "health","Health","part of the Health portfolio" ],
        [ "immigration_and_border_protection","Immigration & Border Protection","part of the Immigration & Border Protection portfolio" ],
        [ "industry_and_science","Industry and Science","part of the Industry and Science portfolio" ],
        [ "infrastructure_and_regional_development","Infrastructure and Regional Development","part of the Infrastructure and Regional Development portfolio" ],
        [ "environment","Environment","part of the Environment portfolio" ],
        [ "prime_minister","Prime Minister","part of the Prime Minister portfolio" ],
        [ "social_services","Social Services","part of the Social Services portfolio" ],
        [ "treasury","Treasury","part of the Treasury portfolio" ],
        [ "veterans_affairs","Veterans' Affairs","part of the Veterans' Affairs portfolio" ],
        [ "minister","Ministers","Politicians who run Government Departments" ],
        [ "federal", "All Federal Authorities", "part of the Federal Government"],

    "States and Territories",
        [ "ACT_state","ACT Authorities","part of the ACT Government" ],

        [ "NSW_state","NSW Authorities","part of the NSW Government" ],
        [ "NSW_council","NSW Councils","a NSW Council" ],

        [ "NT_state","NT Authorities","part of the Northern Territory Government" ],

        [ "QLD_state","QLD Authorities","part of the Queensland Government" ],
        [ "QLD_council","QLD Councils","a Queensland Council" ],

        [ "TAS_state","TAS Authorities","part of the Tasmanian Government" ],
        [ "TAS_council","TAS Councils","a Tasmanian Council" ],

        [ "SA_state","SA Authorities","part of the South Australian Government" ],
        [ "SA_council","SA Councils","a South Australian Council" ],

        [ "VIC_state","VIC Authorities","part of the Victorian Government" ],
        [ "VIC_council","VIC Councils","a Victorian Council" ],

        [ "WA_state","WA Authorities","part of the Western Australian Government" ],
        [ "WA_council","WA Councils","a Western Australian Council" ],
    ]
)
