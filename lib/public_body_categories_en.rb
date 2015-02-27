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
        [ "industry_science","Industry and Science","part of the Industry and Science portfolio" ],
        [ "infrastructure_and_regional_development","Infrastructure and Regional Development","part of the Infrastructure and Regional Development portfolio" ],
        [ "environment","Environment","part of the Environment portfolio" ],
        [ "prime_ministert","Prime Minister","part of the Prime Minister portfolio" ],
        [ "social_services","Social Services","part of the Social Services portfolio" ],
        [ "treasury","Treasury","part of the Treasury portfolio" ],
        [ "veterans_affairs","Veterans' Affairs","part of the Veterans' Affairs portfolio" ],
        [ "minister","Ministers","Politicians who run Government Departments" ],
        [ "federal", "All Federal Authorities"],
    "States and Territories",
        [ "ACT_state","ACT Authorities","Description of ACT Authorities" ],

        [ "NSW_state","NSW Authorities","Includes education, health, the environment, and emergency services in ACT" ],
        [ "NSW_council","NSW Councils","Includes garbage collections, public parks and sporting grounds, libraries, and local planning" ],

        [ "NT_state","NT Authorities","" ],

        [ "QLD_state","QLD Authorities","State Authorities, including Schools" ],
        [ "QLD_council","QLD Councils","description of local authorities" ],

        [ "TAS_state","TAS Authorities","including schools" ],
        [ "TAS_council","TAS Councils","description of local authorities" ],

        [ "SA_state","SA Authorities","including schools" ],
        [ "SA_council","SA Councils","description of local authorities" ],

        [ "VIC_state","VIC Authorities","including schools" ],
        [ "VIC_council","VIC Councils","description of local authorities" ],

        [ "WA_state","WA Authorities","including schools" ],
        [ "WA_council","WA Councils","description of local authorities" ],
    ]
)
