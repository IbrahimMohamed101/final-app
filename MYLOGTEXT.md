E/libEGL  (26929): called unimplemented OpenGL ES API
E/libEGL  (26929): called unimplemented OpenGL ES API
I/flutter (26929): onClose -- MealPlannerBloc
E/libEGL  (26929): called unimplemented OpenGL ES API
I/flutter (26929): onCreate -- MealPlannerBloc
I/flutter (26929): onChange -- MealPlannerBloc, Change { currentState: MealPlannerInitial(), nextState: MealPlannerLoading() }
I/flutter (26929):
I/flutter (26929): ╔╣ Request ║ GET
I/flutter (26929): ║  https://basicdiet145.onrender.com/api/subscriptions/meal-planner-menu
I/flutter (26929): ╚══════════════════════════════════════════════════════════════════════════════════════════╝
I/flutter (26929): ╔ Headers
I/flutter (26929): ╟ accept: application/json
I/flutter (26929): ╟ content-type: application/json
I/flutter (26929): ╟ authorization:
I/flutter (26929): ║ Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2OWYyMzdmMjE5Mjg4ZGJjOWUxNjMxZG
I/flutter (26929): ║ UiLCJyb2xlIjoiY2xpZW50IiwidG9rZW5UeXBlIjoiYXBwX2FjY2VzcyIsImlhdCI6MTc3NzQ5MDg2NSwiZXhwIjox
I/flutter (26929): ║ NzgwMTY5MjY1fQ.wQdMvBRkWrYPGGrvx5HtsUbTO-B9NlayVB5uRMS4rVE
I/flutter (26929): ╟ Accept-Language: ar
I/flutter (26929): ╟ contentType: application/json
I/flutter (26929): ╟ responseType: ResponseType.json
I/flutter (26929): ╟ followRedirects: true
I/flutter (26929): ╟ receiveTimeout: 16:40:00.000000
I/flutter (26929): ╚══════════════════════════════════════════════════════════════════════════════════════════╝
I/flutter (26929):
I/flutter (26929): ╔╣ Response ║ GET ║ Status: 200 OK  ║ Time: 707 ms
I/flutter (26929): ║  https://basicdiet145.onrender.com/api/subscriptions/meal-planner-menu
I/flutter (26929): ╚══════════════════════════════════════════════════════════════════════════════════════════╝
I/flutter (26929): ╔ Headers
I/flutter (26929): ╟ x-dns-prefetch-control: [off]
I/flutter (26929): ╟ x-render-origin-server: [Render]
I/flutter (26929): ╟ date: [Thu, 30 Apr 2026 19:03:14 GMT]
I/flutter (26929): ╟ transfer-encoding: [chunked]
I/flutter (26929): ╟ origin-agent-cluster: [?1]
I/flutter (26929): ╟ vary: [Origin, Accept-Encoding]
I/flutter (26929): ╟ content-encoding: [gzip]
I/flutter (26929): ╟ server: [cloudflare]
I/flutter (26929): ╟ cross-origin-resource-policy: [same-origin]
I/flutter (26929): ╟ cf-ray: [9f48ce260b0be22c-MRS]
I/flutter (26929): ╟ etag: [W/"9016-vZ69KoEdSWavGcG/sy5EGtCdyos"]
I/flutter (26929): ╟ x-frame-options: [SAMEORIGIN]
I/flutter (26929): ╟ content-security-policy:
I/flutter (26929): ║ [default-src 'self';base-uri 'self';font-src 'self' https: data:;form-action 'self';frame-
I/flutter (26929): ║ ancestors 'self';img-src 'self' data:;object-src 'none';script-src 'self';script-src-attr
I/flutter (26929): ║ 'none';style-src 'self' https: 'unsafe-inline';upgrade-insecure-requests]
I/flutter (26929): ╟ connection: [keep-alive]
I/flutter (26929): ╟ strict-transport-security: [max-age=15552000; includeSubDomains]
I/flutter (26929): ╟ referrer-policy: [no-referrer]
I/flutter (26929): ╟ cf-cache-status: [DYNAMIC]
I/flutter (26929): ╟ x-permitted-cross-domain-policies: [none]
I/flutter (26929): ╟ cross-origin-opener-policy: [same-origin]
I/flutter (26929): ╟ content-type: [application/json; charset=utf-8]
I/flutter (26929): ╟ rndr-id: [cc6a16db-7baa-43c6]
I/flutter (26929): ╟ x-xss-protection: [0]
I/flutter (26929): ╟ access-control-allow-credentials: [true]
I/flutter (26929): ╟ alt-svc: [h3=":443"; ma=86400]
I/flutter (26929): ╟ x-download-options: [noopen]
I/flutter (26929): ╟ x-content-type-options: [nosniff]
I/flutter (26929): ╚══════════════════════════════════════════════════════════════════════════════════════════╝
I/flutter (26929): ╔ Body
I/flutter (26929): ║
I/flutter (26929): ║    {
I/flutter (26929): ║         "status": true,
I/flutter (26929): ║         "data": {
I/flutter (26929): ║             "builderCatalog": {
I/flutter (26929): ║                 "categories": [
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f02ab131962803c54b0a2f",
I/flutter (26929): ║                         "key": "standard_carbs",
I/flutter (26929): ║                         "dimension": "carb",
I/flutter (26929): ║                         "name": "كربوهيدرات",
I/flutter (26929): ║                         "description": "اختيارات الكربوهيدرات للوجبات",
I/flutter (26929): ║                         "sortOrder": 10,
I/flutter (26929): ║                         "rules": {maxTypes: 2, maxTotalGrams: 300, unit: grams, ruleKey: carb_split}
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f0b8e9197cc97fb217862c",
I/flutter (26929): ║                         "key": "large_salad",
I/flutter (26929): ║                         "dimension": "carb",
I/flutter (26929): ║                         "name": "سلطة كبيرة مميزة",
I/flutter (26929): ║                         "description": "الهوية المرجعية للسلطة الكبيرة المميزة",
I/flutter (26929): ║                         "sortOrder": 20,
I/flutter (26929): ║                         "rules": {ruleKey: premium_large_salad}
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f02ab131962803c54b0a32",
I/flutter (26929): ║                         "key": "chicken",
I/flutter (26929): ║                         "dimension": "protein",
I/flutter (26929): ║                         "name": "دجاج",
I/flutter (26929): ║                         "description": "خيارات دجاج",
I/flutter (26929): ║                         "sortOrder": 10,
I/flutter (26929): ║                         "rules": {}
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f02ab131962803c54b0a34",
I/flutter (26929): ║                         "key": "beef",
I/flutter (26929): ║                         "dimension": "protein",
I/flutter (26929): ║                         "name": "لحم",
I/flutter (26929): ║                         "description": "خيارات لحم",
I/flutter (26929): ║                         "sortOrder": 20,
I/flutter (26929): ║                         "rules": {dailyLimit: 1, ruleKey: beef_daily_limit, unit: slots}
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f02ab131962803c54b0a35",
I/flutter (26929): ║                         "key": "fish",
I/flutter (26929): ║                         "dimension": "protein",
I/flutter (26929): ║                         "name": "أسماك",
I/flutter (26929): ║                         "description": "خيارات أسماك",
I/flutter (26929): ║                         "sortOrder": 30,
I/flutter (26929): ║                         "rules": {}
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f02ab131962803c54b0a31",
I/flutter (26929): ║                         "key": "eggs",
I/flutter (26929): ║                         "dimension": "protein",
I/flutter (26929): ║                         "name": "بيض",
I/flutter (26929): ║                         "description": "خيارات بيض",
I/flutter (26929): ║                         "sortOrder": 40,
I/flutter (26929): ║                         "rules": {}
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f188fcc48e7ad405aff597",
I/flutter (26929): ║                         "key": "premium",
I/flutter (26929): ║                         "dimension": "protein",
I/flutter (26929): ║                         "name": "بريميوم",
I/flutter (26929): ║                         "description": "خيارات البروتينات المميزة",
I/flutter (26929): ║                         "sortOrder": 50,
I/flutter (26929): ║                         "rules": {}
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f1896831962803c54be727",
I/flutter (26929): ║                         "key": "other",
I/flutter (26929): ║                         "dimension": "protein",
I/flutter (26929): ║                         "name": "أخرى",
I/flutter (26929): ║                         "description": "خيارات أخرى",
I/flutter (26929): ║                         "sortOrder": 60,
I/flutter (26929): ║                         "rules": {}
I/flutter (26929): ║                    }
I/flutter (26929): ║                 ],
I/flutter (26929): ║                 "proteins": [
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f1897d31962803c54be740",
I/flutter (26929): ║                         "displayCategoryKey": "beef",
I/flutter (26929): ║                         "name": "كرات لحم",
I/flutter (26929): ║                         "description": "",
I/flutter (26929): ║                         "proteinFamilyKey": "beef",
I/flutter (26929): ║                         "ruleTags": []
I/flutter (26929): ║                         "selectionType": "standard_meal",
I/flutter (26929): ║                         "isPremium": false,
I/flutter (26929): ║                         "sortOrder": 1
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f1897931962803c54be734",
I/flutter (26929): ║                         "displayCategoryKey": "chicken",
I/flutter (26929): ║                         "name": "فاهيتا",
I/flutter (26929): ║                         "description": "",
I/flutter (26929): ║                         "proteinFamilyKey": "chicken",
I/flutter (26929): ║                         "ruleTags": []
I/flutter (26929): ║                         "selectionType": "standard_meal",
I/flutter (26929): ║                         "isPremium": false,
I/flutter (26929): ║                         "sortOrder": 1
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f1897831962803c54be732",
I/flutter (26929): ║                         "displayCategoryKey": "fish",
I/flutter (26929): ║                         "name": "تونا",
I/flutter (26929): ║                         "description": "",
I/flutter (26929): ║                         "proteinFamilyKey": "fish",
I/flutter (26929): ║                         "ruleTags": []
I/flutter (26929): ║                         "selectionType": "standard_meal",
I/flutter (26929): ║                         "isPremium": false,
I/flutter (26929): ║                         "sortOrder": 1
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f1897831962803c54be731",
I/flutter (26929): ║                         "displayCategoryKey": "eggs",
I/flutter (26929): ║                         "name": "بيض مسلوق",
I/flutter (26929): ║                         "description": "",
I/flutter (26929): ║                         "proteinFamilyKey": "eggs",
I/flutter (26929): ║                         "ruleTags": []
I/flutter (26929): ║                         "selectionType": "standard_meal",
I/flutter (26929): ║                         "isPremium": false,
I/flutter (26929): ║                         "sortOrder": 1
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f1897d31962803c54be741",
I/flutter (26929): ║                         "displayCategoryKey": "beef",
I/flutter (26929): ║                         "name": "لحم استرغانوف",
I/flutter (26929): ║                         "description": "",
I/flutter (26929): ║                         "proteinFamilyKey": "beef",
I/flutter (26929): ║                         "ruleTags": []
I/flutter (26929): ║                         "selectionType": "standard_meal",
I/flutter (26929): ║                         "isPremium": false,
I/flutter (26929): ║                         "sortOrder": 2
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f1897931962803c54be736",
I/flutter (26929): ║                         "displayCategoryKey": "chicken",
I/flutter (26929): ║                         "name": "دجاج زبدة",
I/flutter (26929): ║                         "description": "",
I/flutter (26929): ║                         "proteinFamilyKey": "chicken",
I/flutter (26929): ║                         "ruleTags": []
I/flutter (26929): ║                         "selectionType": "standard_meal",
I/flutter (26929): ║                         "isPremium": false,
I/flutter (26929): ║                         "sortOrder": 2
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f1897a31962803c54be737",
I/flutter (26929): ║                         "displayCategoryKey": "chicken",
I/flutter (26929): ║                         "name": "دجاج كريمة",
I/flutter (26929): ║                         "description": "",
I/flutter (26929): ║                         "proteinFamilyKey": "chicken",
I/flutter (26929): ║                         "ruleTags": []
I/flutter (26929): ║                         "selectionType": "standard_meal",
I/flutter (26929): ║                         "isPremium": false,
I/flutter (26929): ║                         "sortOrder": 3
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f1897a31962803c54be738",
I/flutter (26929): ║                         "displayCategoryKey": "chicken",
I/flutter (26929): ║                         "name": "دجاج كاري وجوز الهند",
I/flutter (26929): ║                         "description": "",
I/flutter (26929): ║                         "proteinFamilyKey": "chicken",
I/flutter (26929): ║                         "ruleTags": []
I/flutter (26929): ║                         "selectionType": "standard_meal",
I/flutter (26929): ║                         "isPremium": false,
I/flutter (26929): ║                         "sortOrder": 4
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f1897a31962803c54be739",
I/flutter (26929): ║                         "displayCategoryKey": "chicken",
I/flutter (26929): ║                         "name": "دجاج سبايسي",
I/flutter (26929): ║                         "description": "",
I/flutter (26929): ║                         "proteinFamilyKey": "chicken",
I/flutter (26929): ║                         "ruleTags": []
I/flutter (26929): ║                         "selectionType": "standard_meal",
I/flutter (26929): ║                         "isPremium": false,
I/flutter (26929): ║                         "sortOrder": 5
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f1897b31962803c54be73a",
I/flutter (26929): ║                         "displayCategoryKey": "chicken",
I/flutter (26929): ║                         "name": "دجاج توابل إيطالية",
I/flutter (26929): ║                         "description": "",
I/flutter (26929): ║                         "proteinFamilyKey": "chicken",
I/flutter (26929): ║                         "ruleTags": []
I/flutter (26929): ║                         "selectionType": "standard_meal",
I/flutter (26929): ║                         "isPremium": false,
I/flutter (26929): ║                         "sortOrder": 6
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f1897b31962803c54be73b",
I/flutter (26929): ║                         "displayCategoryKey": "chicken",
I/flutter (26929): ║                         "name": "دجاج تكا",
I/flutter (26929): ║                         "description": "",
I/flutter (26929): ║                         "proteinFamilyKey": "chicken",
I/flutter (26929): ║                         "ruleTags": []
I/flutter (26929): ║                         "selectionType": "standard_meal",
I/flutter (26929): ║                         "isPremium": false,
I/flutter (26929): ║                         "sortOrder": 7
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f1897b31962803c54be73c",
I/flutter (26929): ║                         "displayCategoryKey": "chicken",
I/flutter (26929): ║                         "name": "دجاج آسيوي",
I/flutter (26929): ║                         "description": "",
I/flutter (26929): ║                         "proteinFamilyKey": "chicken",
I/flutter (26929): ║                         "ruleTags": []
I/flutter (26929): ║                         "selectionType": "standard_meal",
I/flutter (26929): ║                         "isPremium": false,
I/flutter (26929): ║                         "sortOrder": 8
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f1897c31962803c54be73d",
I/flutter (26929): ║                         "displayCategoryKey": "chicken",
I/flutter (26929): ║                         "name": "استربس",
I/flutter (26929): ║                         "description": "",
I/flutter (26929): ║                         "proteinFamilyKey": "chicken",
I/flutter (26929): ║                         "ruleTags": []
I/flutter (26929): ║                         "selectionType": "standard_meal",
I/flutter (26929): ║                         "isPremium": false,
I/flutter (26929): ║                         "sortOrder": 9
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f1897c31962803c54be73e",
I/flutter (26929): ║                         "displayCategoryKey": "chicken",
I/flutter (26929): ║                         "name": "دجاج مشوي",
I/flutter (26929): ║                         "description": "",
I/flutter (26929): ║                         "proteinFamilyKey": "chicken",
I/flutter (26929): ║                         "ruleTags": []
I/flutter (26929): ║                         "selectionType": "standard_meal",
I/flutter (26929): ║                         "isPremium": false,
I/flutter (26929): ║                         "sortOrder": 10
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f1897c31962803c54be73f",
I/flutter (26929): ║                         "displayCategoryKey": "chicken",
I/flutter (26929): ║                         "name": "دجاج مكسيكي",
I/flutter (26929): ║                         "description": "",
I/flutter (26929): ║                         "proteinFamilyKey": "chicken",
I/flutter (26929): ║                         "ruleTags": []
I/flutter (26929): ║                         "selectionType": "standard_meal",
I/flutter (26929): ║                         "isPremium": false,
I/flutter (26929): ║                         "sortOrder": 11
I/flutter (26929): ║                    }
I/flutter (26929): ║                 ],
I/flutter (26929): ║                 "premiumProteins": [
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f188fdc48e7ad405aff5a0",
I/flutter (26929): ║                         "displayCategoryKey": "premium",
I/flutter (26929): ║                         "name": "ستيك لحم",
I/flutter (26929): ║                         "description": "ستيك لحم طري مشوي يقدم بتتبيلة غنية ولمسة مطاعم راقية."
I/flutter (26929): ║                         "proteinFamilyKey": "beef",
I/flutter (26929): ║                         "ruleTags": [premium]
I/flutter (26929): ║                         "selectionType": "premium_meal",
I/flutter (26929): ║                         "isPremium": true,
I/flutter (26929): ║                         "premiumKey": "beef_steak",
I/flutter (26929): ║                         "extraFeeHalala": 2200,
I/flutter (26929): ║                         "sortOrder": 10
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f188fdc48e7ad405aff5a3",
I/flutter (26929): ║                         "displayCategoryKey": "premium",
I/flutter (26929): ║                         "name": "سلمون",
I/flutter (26929): ║                         "description": "فيليه سلمون مشوي مع خضار طازجة ولمسة ليمون وأعشاب خفيفة."
I/flutter (26929): ║                         "proteinFamilyKey": "fish",
I/flutter (26929): ║                         "ruleTags": [premium]
I/flutter (26929): ║                         "selectionType": "premium_meal",
I/flutter (26929): ║                         "isPremium": true,
I/flutter (26929): ║                         "premiumKey": "salmon",
I/flutter (26929): ║                         "extraFeeHalala": 2500,
I/flutter (26929): ║                         "sortOrder": 20
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f188fdc48e7ad405aff59d",
I/flutter (26929): ║                         "displayCategoryKey": "premium",
I/flutter (26929): ║                         "name": "روبيان",
I/flutter (26929): ║                         "description": "طبق روبيان مشوي مع خضار ملونة وصوص خفيف بنكهة غنية."
I/flutter (26929): ║                         "proteinFamilyKey": "fish",
I/flutter (26929): ║                         "ruleTags": [premium]
I/flutter (26929): ║                         "selectionType": "premium_meal",
I/flutter (26929): ║                         "isPremium": true,
I/flutter (26929): ║                         "premiumKey": "shrimp",
I/flutter (26929): ║                         "extraFeeHalala": 2000,
I/flutter (26929): ║                         "sortOrder": 30
I/flutter (26929): ║                    }
I/flutter (26929): ║                 ],
I/flutter (26929): ║                 "carbs": [
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f02ab231962803c54b0a36",
I/flutter (26929): ║                         "displayCategoryKey": "standard_carbs",
I/flutter (26929): ║                         "name": "رز أبيض",
I/flutter (26929): ║                         "description": "",
I/flutter (26929): ║                         "sortOrder": 1
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f02ab231962803c54b0a37",
I/flutter (26929): ║                         "displayCategoryKey": "standard_carbs",
I/flutter (26929): ║                         "name": "رز بالكركم",
I/flutter (26929): ║                         "description": "",
I/flutter (26929): ║                         "sortOrder": 2
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f02ab331962803c54b0a38",
I/flutter (26929): ║                         "displayCategoryKey": "standard_carbs",
I/flutter (26929): ║                         "name": "رز برياني",
I/flutter (26929): ║                         "description": "",
I/flutter (26929): ║                         "sortOrder": 3
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f02ab331962803c54b0a39",
I/flutter (26929): ║                         "displayCategoryKey": "standard_carbs",
I/flutter (26929): ║                         "name": "كينوا",
I/flutter (26929): ║                         "description": "",
I/flutter (26929): ║                         "sortOrder": 4
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f02ab331962803c54b0a3b",
I/flutter (26929): ║                         "displayCategoryKey": "standard_carbs",
I/flutter (26929): ║                         "name": "باستا الفريدو",
I/flutter (26929): ║                         "description": "",
I/flutter (26929): ║                         "sortOrder": 5
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f02ab431962803c54b0a3c",
I/flutter (26929): ║                         "displayCategoryKey": "standard_carbs",
I/flutter (26929): ║                         "name": "باستا بالصوص الأحمر",
I/flutter (26929): ║                         "description": "",
I/flutter (26929): ║                         "sortOrder": 6
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f02ab431962803c54b0a3d",
I/flutter (26929): ║                         "displayCategoryKey": "standard_carbs",
I/flutter (26929): ║                         "name": "بطاطس مشوي",
I/flutter (26929): ║                         "description": "",
I/flutter (26929): ║                         "sortOrder": 7
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f02ab431962803c54b0a3e",
I/flutter (26929): ║                         "displayCategoryKey": "standard_carbs",
I/flutter (26929): ║                         "name": "بطاطا حلوة",
I/flutter (26929): ║                         "description": "",
I/flutter (26929): ║                         "sortOrder": 8
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f02ab531962803c54b0a3f",
I/flutter (26929): ║                         "displayCategoryKey": "standard_carbs",
I/flutter (26929): ║                         "name": "خضار مشكل مشوي",
I/flutter (26929): ║                         "description": "",
I/flutter (26929): ║                         "sortOrder": 9
I/flutter (26929): ║                    }
I/flutter (26929): ║                 ],
I/flutter (26929): ║                 "sandwiches": [
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f3a136d960b113ace19df3",
I/flutter (26929): ║                         "name": "بيض مسلوق",
I/flutter (26929): ║                         "description": "",
I/flutter (26929): ║                         "imageUrl": "",
I/flutter (26929): ║                         "calories": 0,
I/flutter (26929): ║                         "selectionType": "sandwich",
I/flutter (26929): ║                         "categoryKey": "sandwich",
I/flutter (26929): ║                         "pricingModel": "included",
I/flutter (26929): ║                         "priceHalala": 0,
I/flutter (26929): ║                         "proteinFamilyKey": "eggs",
I/flutter (26929): ║                         "sortOrder": 1
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f3a209d960b113ace19dfd",
I/flutter (26929): ║                         "name": "تركي",
I/flutter (26929): ║                         "description": "",
I/flutter (26929): ║                         "imageUrl": "",
I/flutter (26929): ║                         "calories": 0,
I/flutter (26929): ║                         "selectionType": "sandwich",
I/flutter (26929): ║                         "categoryKey": "sandwich",
I/flutter (26929): ║                         "pricingModel": "included",
I/flutter (26929): ║                         "priceHalala": 0,
I/flutter (26929): ║                         "proteinFamilyKey": "other",
I/flutter (26929): ║                         "sortOrder": 2
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f3a212d960b113ace19dff",
I/flutter (26929): ║                         "name": "حلوم كلاسيكي",
I/flutter (26929): ║                         "description": "",
I/flutter (26929): ║                         "imageUrl": "",
I/flutter (26929): ║                         "calories": 0,
I/flutter (26929): ║                         "selectionType": "sandwich",
I/flutter (26929): ║                         "categoryKey": "sandwich",
I/flutter (26929): ║                         "pricingModel": "included",
I/flutter (26929): ║                         "priceHalala": 0,
I/flutter (26929): ║                         "proteinFamilyKey": "other",
I/flutter (26929): ║                         "sortOrder": 3
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f3a21bd960b113ace19e01",
I/flutter (26929): ║                         "name": "تونا",
I/flutter (26929): ║                         "description": "",
I/flutter (26929): ║                         "imageUrl": "",
I/flutter (26929): ║                         "calories": 0,
I/flutter (26929): ║                         "selectionType": "sandwich",
I/flutter (26929): ║                         "categoryKey": "sandwich",
I/flutter (26929): ║                         "pricingModel": "included",
I/flutter (26929): ║                         "priceHalala": 0,
I/flutter (26929): ║                         "proteinFamilyKey": "fish",
I/flutter (26929): ║                         "sortOrder": 4
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f3a226d960b113ace19e03",
I/flutter (26929): ║                         "name": "بيض اسكرامبل",
I/flutter (26929): ║                         "description": "",
I/flutter (26929): ║                         "imageUrl": "",
I/flutter (26929): ║                         "calories": 0,
I/flutter (26929): ║                         "selectionType": "sandwich",
I/flutter (26929): ║                         "categoryKey": "sandwich",
I/flutter (26929): ║                         "pricingModel": "included",
I/flutter (26929): ║                         "priceHalala": 0,
I/flutter (26929): ║                         "proteinFamilyKey": "eggs",
I/flutter (26929): ║                         "sortOrder": 5
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f3a22fd960b113ace19e07",
I/flutter (26929): ║                         "name": "دجاج فاهيتا",
I/flutter (26929): ║                         "description": "",
I/flutter (26929): ║                         "imageUrl": "",
I/flutter (26929): ║                         "calories": 0,
I/flutter (26929): ║                         "selectionType": "sandwich",
I/flutter (26929): ║                         "categoryKey": "sandwich",
I/flutter (26929): ║                         "pricingModel": "included",
I/flutter (26929): ║                         "priceHalala": 0,
I/flutter (26929): ║                         "proteinFamilyKey": "chicken",
I/flutter (26929): ║                         "sortOrder": 6
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f3a238d960b113ace19e09",
I/flutter (26929): ║                         "name": "دجاج مكسيكي",
I/flutter (26929): ║                         "description": "",
I/flutter (26929): ║                         "imageUrl": "",
I/flutter (26929): ║                         "calories": 0,
I/flutter (26929): ║                         "selectionType": "sandwich",
I/flutter (26929): ║                         "categoryKey": "sandwich",
I/flutter (26929): ║                         "pricingModel": "included",
I/flutter (26929): ║                         "priceHalala": 0,
I/flutter (26929): ║                         "proteinFamilyKey": "chicken",
I/flutter (26929): ║                         "sortOrder": 7
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f3a241d960b113ace19e0b",
I/flutter (26929): ║                         "name": "دجاج مشوي",
I/flutter (26929): ║                         "description": "",
I/flutter (26929): ║                         "imageUrl": "",
I/flutter (26929): ║                         "calories": 0,
I/flutter (26929): ║                         "selectionType": "sandwich",
I/flutter (26929): ║                         "categoryKey": "sandwich",
I/flutter (26929): ║                         "pricingModel": "included",
I/flutter (26929): ║                         "priceHalala": 0,
I/flutter (26929): ║                         "proteinFamilyKey": "chicken",
I/flutter (26929): ║                         "sortOrder": 8
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f18904c48e7ad405aff5ce",
I/flutter (26929): ║                         "name": "ساندويتش",
I/flutter (26929): ║                         "description": "ساندويتش",
I/flutter (26929): ║                         "imageUrl": "",
I/flutter (26929): ║                         "calories": 0,
I/flutter (26929): ║                         "selectionType": "sandwich",
I/flutter (26929): ║                         "categoryKey": "sandwich",
I/flutter (26929): ║                         "pricingModel": "included",
I/flutter (26929): ║                         "priceHalala": 0,
I/flutter (26929): ║                         "proteinFamilyKey": "other",
I/flutter (26929): ║                         "sortOrder": 0
I/flutter (26929): ║                    }
I/flutter (26929): ║                 ],
I/flutter (26929): ║                 "premiumLargeSalad": {
I/flutter (26929): ║                     "id": "premium_large_salad",
I/flutter (26929): ║                     "enabled": true,
I/flutter (26929): ║                     "carbId": "69f1897831962803c54be730",
I/flutter (26929): ║                     "premiumKey": "custom_premium_salad",
I/flutter (26929): ║                     "selectionType": "premium_large_salad",
I/flutter (26929): ║                     "presetKey": "large_salad",
I/flutter (26929): ║                     "name": "سلطة كبيرة مميزة",
I/flutter (26929): ║                     "extraFeeHalala": 3000,
I/flutter (26929): ║                     "currency": "SAR",
I/flutter (26929): ║                     "preset": {
I/flutter (26929): ║                         "key": "large_salad",
I/flutter (26929): ║                         "name": "سلطة كبيرة مميزة",
I/flutter (26929): ║                         "selectionType": "premium_large_salad",
I/flutter (26929): ║                         "fixedPriceHalala": 3000,
I/flutter (26929): ║                         "currency": "SAR",
I/flutter (26929): ║                         "groups": [
I/flutter (26929): ║                          {key: leafy_greens, name: ورقيات, minSelect: 0, maxSelect: 99},
I/flutter (26929): ║                          {key: vegetables, name: خضار, minSelect: 0, maxSelect: 99},
I/flutter (26929): ║                          {key: protein, name: بروتين, minSelect: 1, maxSelect: 1},
I/flutter (26929): ║                          {key: cheese_nuts, name: أجبان ومكسرات, minSelect: 0, maxSelect: 99},
I/flutter (26929): ║                          {key: fruits, name: فواكه, minSelect: 0, maxSelect: 99},
I/flutter (26929): ║                          {key: sauce, name: صوص, minSelect: 1, maxSelect: 1}
I/flutter (26929): ║                         ]
I/flutter (26929): ║                    }
I/flutter (26929): ║                     "groups": [
I/flutter (26929): ║                      {key: leafy_greens, name: ورقيات, minSelect: 0, maxSelect: 99},
I/flutter (26929): ║                      {key: vegetables, name: خضار, minSelect: 0, maxSelect: 99},
I/flutter (26929): ║                      {key: protein, name: بروتين, minSelect: 1, maxSelect: 1},
I/flutter (26929): ║                      {key: cheese_nuts, name: أجبان ومكسرات, minSelect: 0, maxSelect: 99},
I/flutter (26929): ║                      {key: fruits, name: فواكه, minSelect: 0, maxSelect: 99},
I/flutter (26929): ║                      {key: sauce, name: صوص, minSelect: 1, maxSelect: 1}
I/flutter (26929): ║                     ],
I/flutter (26929): ║                     "ingredients": [
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f188ff31962803c54be6b5",
I/flutter (26929): ║                             "groupKey": "leafy_greens",
I/flutter (26929): ║                             "name": "خس روماني",
I/flutter (26929): ║                             "calories": 0,
I/flutter (26929): ║                             "sortOrder": 10
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f188ff31962803c54be6b6",
I/flutter (26929): ║                             "groupKey": "leafy_greens",
I/flutter (26929): ║                             "name": "جرجير",
I/flutter (26929): ║                             "calories": 0,
I/flutter (26929): ║                             "sortOrder": 20
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f00a8431962803c54af61c",
I/flutter (26929): ║                             "groupKey": "vegetables",
I/flutter (26929): ║                             "name": "الخضروات",
I/flutter (26929): ║                             "calories": 0,
I/flutter (26929): ║                             "sortOrder": 1
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f188ff31962803c54be6b7",
I/flutter (26929): ║                             "groupKey": "vegetables",
I/flutter (26929): ║                             "name": "بصل مخلل",
I/flutter (26929): ║                             "calories": 50,
I/flutter (26929): ║                             "sortOrder": 20.02
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1890031962803c54be6b8",
I/flutter (26929): ║                             "groupKey": "vegetables",
I/flutter (26929): ║                             "name": "نعناع",
I/flutter (26929): ║                             "calories": 50,
I/flutter (26929): ║                             "sortOrder": 20.03
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1890031962803c54be6b9",
I/flutter (26929): ║                             "groupKey": "vegetables",
I/flutter (26929): ║                             "name": "زيتون أسود",
I/flutter (26929): ║                             "calories": 50,
I/flutter (26929): ║                             "sortOrder": 20.04
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1890031962803c54be6ba",
I/flutter (26929): ║                             "groupKey": "vegetables",
I/flutter (26929): ║                             "name": "زيتون أخضر",
I/flutter (26929): ║                             "calories": 50,
I/flutter (26929): ║                             "sortOrder": 20.05
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1890031962803c54be6bb",
I/flutter (26929): ║                             "groupKey": "vegetables",
I/flutter (26929): ║                             "name": "بروكلي",
I/flutter (26929): ║                             "calories": 50,
I/flutter (26929): ║                             "sortOrder": 20.06
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1890031962803c54be6bc",
I/flutter (26929): ║                             "groupKey": "vegetables",
I/flutter (26929): ║                             "name": "فطر",
I/flutter (26929): ║                             "calories": 50,
I/flutter (26929): ║                             "sortOrder": 20.07
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1890031962803c54be6bd",
I/flutter (26929): ║                             "groupKey": "vegetables",
I/flutter (26929): ║                             "name": "كزبرة",
I/flutter (26929): ║                             "calories": 50,
I/flutter (26929): ║                             "sortOrder": 20.08
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1890031962803c54be6be",
I/flutter (26929): ║                             "groupKey": "vegetables",
I/flutter (26929): ║                             "name": "فلفل",
I/flutter (26929): ║                             "calories": 50,
I/flutter (26929): ║                             "sortOrder": 20.09
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1890131962803c54be6c0",
I/flutter (26929): ║                             "groupKey": "vegetables",
I/flutter (26929): ║                             "name": "هالينو",
I/flutter (26929): ║                             "calories": 50,
I/flutter (26929): ║                             "sortOrder": 20.11
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1898431962803c54be749",
I/flutter (26929): ║                             "groupKey": "vegetables",
I/flutter (26929): ║                             "name": "خيار",
I/flutter (26929): ║                             "calories": 0,
I/flutter (26929): ║                             "sortOrder": 30
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1890131962803c54be6bf",
I/flutter (26929): ║                             "groupKey": "vegetables",
I/flutter (26929): ║                             "name": "بنجر",
I/flutter (26929): ║                             "calories": 0,
I/flutter (26929): ║                             "sortOrder": 40
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f00a8431962803c54af61d",
I/flutter (26929): ║                             "groupKey": "cheese_nuts",
I/flutter (26929): ║                             "name": "الإضافات",
I/flutter (26929): ║                             "calories": 0,
I/flutter (26929): ║                             "sortOrder": 2
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f00a8531962803c54af620",
I/flutter (26929): ║                             "groupKey": "cheese_nuts",
I/flutter (26929): ║                             "name": "المكسرات",
I/flutter (26929): ║                             "calories": 0,
I/flutter (26929): ║                             "sortOrder": 4
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1890131962803c54be6c2",
I/flutter (26929): ║                             "groupKey": "cheese_nuts",
I/flutter (26929): ║                             "name": "فيتا",
I/flutter (26929): ║                             "calories": 50,
I/flutter (26929): ║                             "sortOrder": 40.13
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1890231962803c54be6c7",
I/flutter (26929): ║                             "groupKey": "cheese_nuts",
I/flutter (26929): ║                             "name": "سمسم",
I/flutter (26929): ║                             "calories": 50,
I/flutter (26929): ║                             "sortOrder": 40.18
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1890231962803c54be6c9",
I/flutter (26929): ║                             "groupKey": "cheese_nuts",
I/flutter (26929): ║                             "name": "كاجو",
I/flutter (26929): ║                             "calories": 50,
I/flutter (26929): ║                             "sortOrder": 40.19
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1890131962803c54be6c1",
I/flutter (26929): ║                             "groupKey": "cheese_nuts",
I/flutter (26929): ║                             "name": "بارميزان",
I/flutter (26929): ║                             "calories": 0,
I/flutter (26929): ║                             "sortOrder": 50
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1890331962803c54be6ca",
I/flutter (26929): ║                             "groupKey": "cheese_nuts",
I/flutter (26929): ║                             "name": "عين الجمل",
I/flutter (26929): ║                             "calories": 0,
I/flutter (26929): ║                             "sortOrder": 60
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f00a8531962803c54af61f",
I/flutter (26929): ║                             "groupKey": "fruits",
I/flutter (26929): ║                             "name": "الفواكه",
I/flutter (26929): ║                             "calories": 0,
I/flutter (26929): ║                             "sortOrder": 3
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1890131962803c54be6c3",
I/flutter (26929): ║                             "groupKey": "fruits",
I/flutter (26929): ║                             "name": "تمر",
I/flutter (26929): ║                             "calories": 50,
I/flutter (26929): ║                             "sortOrder": 50.14
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1890231962803c54be6c4",
I/flutter (26929): ║                             "groupKey": "fruits",
I/flutter (26929): ║                             "name": "توت أزرق",
I/flutter (26929): ║                             "calories": 50,
I/flutter (26929): ║                             "sortOrder": 50.15
I/flutter (26929): ║                        },
I/flutter (26929): ║                      {id: 69f1890231962803c54be6c6, groupKey: fruits, name: رمان, calories: 0, sortOrder: 70},
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1890231962803c54be6c5",
I/flutter (26929): ║                             "groupKey": "fruits",
I/flutter (26929): ║                             "name": "فراولة",
I/flutter (26929): ║                             "calories": 0,
I/flutter (26929): ║                             "sortOrder": 80
I/flutter (26929): ║                        },
I/flutter (26929): ║                      {id: 69f00a8531962803c54af621, groupKey: sauce, name: الصوص, calories: 0, sortOrder: 5},
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1890331962803c54be6cc",
I/flutter (26929): ║                             "groupKey": "sauce",
I/flutter (26929): ║                             "name": "عسل بالليمون",
I/flutter (26929): ║                             "calories": 50,
I/flutter (26929): ║                             "sortOrder": 60.21
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1890331962803c54be6cd",
I/flutter (26929): ║                             "groupKey": "sauce",
I/flutter (26929): ║                             "name": "زبادي بالنعناع",
I/flutter (26929): ║                             "calories": 50,
I/flutter (26929): ║                             "sortOrder": 60.22
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1890331962803c54be6cf",
I/flutter (26929): ║                             "groupKey": "sauce",
I/flutter (26929): ║                             "name": "صوص بيستو",
I/flutter (26929): ║                             "calories": 50,
I/flutter (26929): ║                             "sortOrder": 60.24
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1890431962803c54be6d2",
I/flutter (26929): ║                             "groupKey": "sauce",
I/flutter (26929): ║                             "name": "رانش",
I/flutter (26929): ║                             "calories": 50,
I/flutter (26929): ║                             "sortOrder": 60.26
I/flutter (26929): ║                        },
I/flutter (26929): ║                      {id: 69f1890431962803c54be6d0, groupKey: sauce, name: سيزر, calories: 0, sortOrder: 90},
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1890331962803c54be6ce",
I/flutter (26929): ║                             "groupKey": "sauce",
I/flutter (26929): ║                             "name": "هاني ماستر",
I/flutter (26929): ║                             "calories": 0,
I/flutter (26929): ║                             "sortOrder": 100
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1897931962803c54be734",
I/flutter (26929): ║                             "groupKey": "protein",
I/flutter (26929): ║                             "name": "فاهيتا",
I/flutter (26929): ║                             "calories": 0,
I/flutter (26929): ║                             "displayCategoryKey": "chicken",
I/flutter (26929): ║                             "proteinFamilyKey": "chicken",
I/flutter (26929): ║                             "isPremium": false,
I/flutter (26929): ║                             "premiumKey": null,
I/flutter (26929): ║                             "extraFeeHalala": 0,
I/flutter (26929): ║                             "sortOrder": 1
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1897931962803c54be736",
I/flutter (26929): ║                             "groupKey": "protein",
I/flutter (26929): ║                             "name": "دجاج زبدة",
I/flutter (26929): ║                             "calories": 0,
I/flutter (26929): ║                             "displayCategoryKey": "chicken",
I/flutter (26929): ║                             "proteinFamilyKey": "chicken",
I/flutter (26929): ║                             "isPremium": false,
I/flutter (26929): ║                             "premiumKey": null,
I/flutter (26929): ║                             "extraFeeHalala": 0,
I/flutter (26929): ║                             "sortOrder": 2
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1897a31962803c54be737",
I/flutter (26929): ║                             "groupKey": "protein",
I/flutter (26929): ║                             "name": "دجاج كريمة",
I/flutter (26929): ║                             "calories": 0,
I/flutter (26929): ║                             "displayCategoryKey": "chicken",
I/flutter (26929): ║                             "proteinFamilyKey": "chicken",
I/flutter (26929): ║                             "isPremium": false,
I/flutter (26929): ║                             "premiumKey": null,
I/flutter (26929): ║                             "extraFeeHalala": 0,
I/flutter (26929): ║                             "sortOrder": 3
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1897a31962803c54be738",
I/flutter (26929): ║                             "groupKey": "protein",
I/flutter (26929): ║                             "name": "دجاج كاري وجوز الهند",
I/flutter (26929): ║                             "calories": 0,
I/flutter (26929): ║                             "displayCategoryKey": "chicken",
I/flutter (26929): ║                             "proteinFamilyKey": "chicken",
I/flutter (26929): ║                             "isPremium": false,
I/flutter (26929): ║                             "premiumKey": null,
I/flutter (26929): ║                             "extraFeeHalala": 0,
I/flutter (26929): ║                             "sortOrder": 4
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1897a31962803c54be739",
I/flutter (26929): ║                             "groupKey": "protein",
I/flutter (26929): ║                             "name": "دجاج سبايسي",
I/flutter (26929): ║                             "calories": 0,
I/flutter (26929): ║                             "displayCategoryKey": "chicken",
I/flutter (26929): ║                             "proteinFamilyKey": "chicken",
I/flutter (26929): ║                             "isPremium": false,
I/flutter (26929): ║                             "premiumKey": null,
I/flutter (26929): ║                             "extraFeeHalala": 0,
I/flutter (26929): ║                             "sortOrder": 5
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1897b31962803c54be73a",
I/flutter (26929): ║                             "groupKey": "protein",
I/flutter (26929): ║                             "name": "دجاج توابل إيطالية",
I/flutter (26929): ║                             "calories": 0,
I/flutter (26929): ║                             "displayCategoryKey": "chicken",
I/flutter (26929): ║                             "proteinFamilyKey": "chicken",
I/flutter (26929): ║                             "isPremium": false,
I/flutter (26929): ║                             "premiumKey": null,
I/flutter (26929): ║                             "extraFeeHalala": 0,
I/flutter (26929): ║                             "sortOrder": 6
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1897b31962803c54be73b",
I/flutter (26929): ║                             "groupKey": "protein",
I/flutter (26929): ║                             "name": "دجاج تكا",
I/flutter (26929): ║                             "calories": 0,
I/flutter (26929): ║                             "displayCategoryKey": "chicken",
I/flutter (26929): ║                             "proteinFamilyKey": "chicken",
I/flutter (26929): ║                             "isPremium": false,
I/flutter (26929): ║                             "premiumKey": null,
I/flutter (26929): ║                             "extraFeeHalala": 0,
I/flutter (26929): ║                             "sortOrder": 7
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1897b31962803c54be73c",
I/flutter (26929): ║                             "groupKey": "protein",
I/flutter (26929): ║                             "name": "دجاج آسيوي",
I/flutter (26929): ║                             "calories": 0,
I/flutter (26929): ║                             "displayCategoryKey": "chicken",
I/flutter (26929): ║                             "proteinFamilyKey": "chicken",
I/flutter (26929): ║                             "isPremium": false,
I/flutter (26929): ║                             "premiumKey": null,
I/flutter (26929): ║                             "extraFeeHalala": 0,
I/flutter (26929): ║                             "sortOrder": 8
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1897c31962803c54be73d",
I/flutter (26929): ║                             "groupKey": "protein",
I/flutter (26929): ║                             "name": "استربس",
I/flutter (26929): ║                             "calories": 0,
I/flutter (26929): ║                             "displayCategoryKey": "chicken",
I/flutter (26929): ║                             "proteinFamilyKey": "chicken",
I/flutter (26929): ║                             "isPremium": false,
I/flutter (26929): ║                             "premiumKey": null,
I/flutter (26929): ║                             "extraFeeHalala": 0,
I/flutter (26929): ║                             "sortOrder": 9
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1897c31962803c54be73e",
I/flutter (26929): ║                             "groupKey": "protein",
I/flutter (26929): ║                             "name": "دجاج مشوي",
I/flutter (26929): ║                             "calories": 0,
I/flutter (26929): ║                             "displayCategoryKey": "chicken",
I/flutter (26929): ║                             "proteinFamilyKey": "chicken",
I/flutter (26929): ║                             "isPremium": false,
I/flutter (26929): ║                             "premiumKey": null,
I/flutter (26929): ║                             "extraFeeHalala": 0,
I/flutter (26929): ║                             "sortOrder": 10
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1897c31962803c54be73f",
I/flutter (26929): ║                             "groupKey": "protein",
I/flutter (26929): ║                             "name": "دجاج مكسيكي",
I/flutter (26929): ║                             "calories": 0,
I/flutter (26929): ║                             "displayCategoryKey": "chicken",
I/flutter (26929): ║                             "proteinFamilyKey": "chicken",
I/flutter (26929): ║                             "isPremium": false,
I/flutter (26929): ║                             "premiumKey": null,
I/flutter (26929): ║                             "extraFeeHalala": 0,
I/flutter (26929): ║                             "sortOrder": 11
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1897d31962803c54be740",
I/flutter (26929): ║                             "groupKey": "protein",
I/flutter (26929): ║                             "name": "كرات لحم",
I/flutter (26929): ║                             "calories": 0,
I/flutter (26929): ║                             "displayCategoryKey": "beef",
I/flutter (26929): ║                             "proteinFamilyKey": "beef",
I/flutter (26929): ║                             "isPremium": false,
I/flutter (26929): ║                             "premiumKey": null,
I/flutter (26929): ║                             "extraFeeHalala": 0,
I/flutter (26929): ║                             "sortOrder": 1
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1897d31962803c54be741",
I/flutter (26929): ║                             "groupKey": "protein",
I/flutter (26929): ║                             "name": "لحم استرغانوف",
I/flutter (26929): ║                             "calories": 0,
I/flutter (26929): ║                             "displayCategoryKey": "beef",
I/flutter (26929): ║                             "proteinFamilyKey": "beef",
I/flutter (26929): ║                             "isPremium": false,
I/flutter (26929): ║                             "premiumKey": null,
I/flutter (26929): ║                             "extraFeeHalala": 0,
I/flutter (26929): ║                             "sortOrder": 2
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1897831962803c54be732",
I/flutter (26929): ║                             "groupKey": "protein",
I/flutter (26929): ║                             "name": "تونا",
I/flutter (26929): ║                             "calories": 0,
I/flutter (26929): ║                             "displayCategoryKey": "fish",
I/flutter (26929): ║                             "proteinFamilyKey": "fish",
I/flutter (26929): ║                             "isPremium": false,
I/flutter (26929): ║                             "premiumKey": null,
I/flutter (26929): ║                             "extraFeeHalala": 0,
I/flutter (26929): ║                             "sortOrder": 1
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f1897831962803c54be731",
I/flutter (26929): ║                             "groupKey": "protein",
I/flutter (26929): ║                             "name": "بيض مسلوق",
I/flutter (26929): ║                             "calories": 0,
I/flutter (26929): ║                             "displayCategoryKey": "eggs",
I/flutter (26929): ║                             "proteinFamilyKey": "eggs",
I/flutter (26929): ║                             "isPremium": false,
I/flutter (26929): ║                             "premiumKey": null,
I/flutter (26929): ║                             "extraFeeHalala": 0,
I/flutter (26929): ║                             "sortOrder": 1
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f188fdc48e7ad405aff5a0",
I/flutter (26929): ║                             "groupKey": "protein",
I/flutter (26929): ║                             "name": "ستيك لحم",
I/flutter (26929): ║                             "calories": 0,
I/flutter (26929): ║                             "displayCategoryKey": "premium",
I/flutter (26929): ║                             "proteinFamilyKey": "beef",
I/flutter (26929): ║                             "isPremium": true,
I/flutter (26929): ║                             "premiumKey": "beef_steak",
I/flutter (26929): ║                             "extraFeeHalala": 2200,
I/flutter (26929): ║                             "sortOrder": 10
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f188fdc48e7ad405aff5a3",
I/flutter (26929): ║                             "groupKey": "protein",
I/flutter (26929): ║                             "name": "سلمون",
I/flutter (26929): ║                             "calories": 0,
I/flutter (26929): ║                             "displayCategoryKey": "premium",
I/flutter (26929): ║                             "proteinFamilyKey": "fish",
I/flutter (26929): ║                             "isPremium": true,
I/flutter (26929): ║                             "premiumKey": "salmon",
I/flutter (26929): ║                             "extraFeeHalala": 2500,
I/flutter (26929): ║                             "sortOrder": 20
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f188fdc48e7ad405aff59d",
I/flutter (26929): ║                             "groupKey": "protein",
I/flutter (26929): ║                             "name": "روبيان",
I/flutter (26929): ║                             "calories": 0,
I/flutter (26929): ║                             "displayCategoryKey": "premium",
I/flutter (26929): ║                             "proteinFamilyKey": "fish",
I/flutter (26929): ║                             "isPremium": true,
I/flutter (26929): ║                             "premiumKey": "shrimp",
I/flutter (26929): ║                             "extraFeeHalala": 2000,
I/flutter (26929): ║                             "sortOrder": 30
I/flutter (26929): ║                        }
I/flutter (26929): ║                     ]
I/flutter (26929): ║                }
I/flutter (26929): ║                 "rules": {
I/flutter (26929): ║                     "version": "meal_planner_rules.v3",
I/flutter (26929): ║                     "beef": {proteinFamilyKey: beef, maxSlotsPerDay: 1},
I/flutter (26929): ║                     "standardCarbs": {maxTypes: 2, maxTotalGrams: 300, unit: grams},
I/flutter (26929): ║                     "premiumCarbs": {maxTypes: 2, maxTotalGrams: 300, unit: grams},
I/flutter (26929): ║                     "proteinGroups": [
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "key": "chicken",
I/flutter (26929): ║                             "name": {ar: دجاج, en: Chicken},
I/flutter (26929): ║                             "sortOrder": 10
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "key": "beef",
I/flutter (26929): ║                             "name": {ar: لحم, en: Beef},
I/flutter (26929): ║                             "sortOrder": 20
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "key": "fish",
I/flutter (26929): ║                             "name": {ar: أسماك, en: Fish},
I/flutter (26929): ║                             "sortOrder": 30
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "key": "eggs",
I/flutter (26929): ║                             "name": {ar: بيض, en: Eggs},
I/flutter (26929): ║                             "sortOrder": 40
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "key": "premium",
I/flutter (26929): ║                             "name": {ar: بريميوم, en: Premium},
I/flutter (26929): ║                             "sortOrder": 50
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "key": "other",
I/flutter (26929): ║                             "name": {ar: أخرى, en: Other},
I/flutter (26929): ║                             "sortOrder": 60
I/flutter (26929): ║                        }
I/flutter (26929): ║                     ],
I/flutter (26929): ║                     "premiumLargeSalad": {
I/flutter (26929): ║                         "premiumKey": "custom_premium_salad",
I/flutter (26929): ║                         "presetKey": "large_salad",
I/flutter (26929): ║                         "extraFeeHalala": 3000,
I/flutter (26929): ║                         "groups": [
I/flutter (26929): ║                          {key: leafy_greens, minSelect: 0, maxSelect: 99},
I/flutter (26929): ║                          {key: vegetables, minSelect: 0, maxSelect: 99},
I/flutter (26929): ║                          {key: protein, minSelect: 1, maxSelect: 1},
I/flutter (26929): ║                          {key: cheese_nuts, minSelect: 0, maxSelect: 99},
I/flutter (26929): ║                          {key: fruits, minSelect: 0, maxSelect: 99},
I/flutter (26929): ║                          {key: sauce, minSelect: 1, maxSelect: 1}
I/flutter (26929): ║                         ]
I/flutter (26929): ║                    }
I/flutter (26929): ║                }
I/flutter (26929): ║            }
I/flutter (26929): ║             "addonCatalog": {
I/flutter (26929): ║                 "items": [
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f2399d4eee65376d14b40a",
I/flutter (26929): ║                         "name": "بيري بلاست",
I/flutter (26929): ║                         "description": "عصير ضمن فئة العصير.",
I/flutter (26929): ║                         "imageUrl": "",
I/flutter (26929): ║                         "currency": "SAR",
I/flutter (26929): ║                         "priceHalala": 1100,
I/flutter (26929): ║                         "priceSar": 11,
I/flutter (26929): ║                         "priceLabel": "11 SAR",
I/flutter (26929): ║                         "kind": "item",
I/flutter (26929): ║                         "category": "juice",
I/flutter (26929): ║                         "type": "one_time",
I/flutter (26929): ║                         "billingMode": "flat_once",
I/flutter (26929): ║                         "pricingModel": "one_time",
I/flutter (26929): ║                         "billingUnit": "item",
I/flutter (26929): ║                         "ui": {
I/flutter (26929): ║                             "title": "بيري بلاست",
I/flutter (26929): ║                             "subtitle": "عصير ضمن فئة العصير.",
I/flutter (26929): ║                             "ctaLabel": "أضف",
I/flutter (26929): ║                             "badge": "إضافة مرة واحدة"
I/flutter (26929): ║                        }
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f2399d4eee65376d14b40b",
I/flutter (26929): ║                         "name": "بيري بروت",
I/flutter (26929): ║                         "description": "عصير ضمن فئة العصير.",
I/flutter (26929): ║                         "imageUrl": "",
I/flutter (26929): ║                         "currency": "SAR",
I/flutter (26929): ║                         "priceHalala": 1300,
I/flutter (26929): ║                         "priceSar": 13,
I/flutter (26929): ║                         "priceLabel": "13 SAR",
I/flutter (26929): ║                         "kind": "item",
I/flutter (26929): ║                         "category": "juice",
I/flutter (26929): ║                         "type": "one_time",
I/flutter (26929): ║                         "billingMode": "flat_once",
I/flutter (26929): ║                         "pricingModel": "one_time",
I/flutter (26929): ║                         "billingUnit": "item",
I/flutter (26929): ║                         "ui": {title: بيري بروت, subtitle: عصير ضمن فئة العصير., ctaLabel: أضف, badge: إضافة مرة واحدة}
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f2399d4eee65376d14b40c",
I/flutter (26929): ║                         "name": "كلاسيك جرين",
I/flutter (26929): ║                         "description": "عصير ضمن فئة العصير.",
I/flutter (26929): ║                         "imageUrl": "",
I/flutter (26929): ║                         "currency": "SAR",
I/flutter (26929): ║                         "priceHalala": 1100,
I/flutter (26929): ║                         "priceSar": 11,
I/flutter (26929): ║                         "priceLabel": "11 SAR",
I/flutter (26929): ║                         "kind": "item",
I/flutter (26929): ║                         "category": "juice",
I/flutter (26929): ║                         "type": "one_time",
I/flutter (26929): ║                         "billingMode": "flat_once",
I/flutter (26929): ║                         "pricingModel": "one_time",
I/flutter (26929): ║                         "billingUnit": "item",
I/flutter (26929): ║                         "ui": {
I/flutter (26929): ║                             "title": "كلاسيك جرين",
I/flutter (26929): ║                             "subtitle": "عصير ضمن فئة العصير.",
I/flutter (26929): ║                             "ctaLabel": "أضف",
I/flutter (26929): ║                             "badge": "إضافة مرة واحدة"
I/flutter (26929): ║                        }
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f2399d4eee65376d14b40d",
I/flutter (26929): ║                         "name": "بيت بانش",
I/flutter (26929): ║                         "description": "عصير ضمن فئة العصير.",
I/flutter (26929): ║                         "imageUrl": "",
I/flutter (26929): ║                         "currency": "SAR",
I/flutter (26929): ║                         "priceHalala": 1100,
I/flutter (26929): ║                         "priceSar": 11,
I/flutter (26929): ║                         "priceLabel": "11 SAR",
I/flutter (26929): ║                         "kind": "item",
I/flutter (26929): ║                         "category": "juice",
I/flutter (26929): ║                         "type": "one_time",
I/flutter (26929): ║                         "billingMode": "flat_once",
I/flutter (26929): ║                         "pricingModel": "one_time",
I/flutter (26929): ║                         "billingUnit": "item",
I/flutter (26929): ║                         "ui": {title: بيت بانش, subtitle: عصير ضمن فئة العصير., ctaLabel: أضف, badge: إضافة مرة واحدة}
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f2399d4eee65376d14b40e",
I/flutter (26929): ║                         "name": "أورانج كاروت",
I/flutter (26929): ║                         "description": "عصير ضمن فئة العصير.",
I/flutter (26929): ║                         "imageUrl": "",
I/flutter (26929): ║                         "currency": "SAR",
I/flutter (26929): ║                         "priceHalala": 1100,
I/flutter (26929): ║                         "priceSar": 11,
I/flutter (26929): ║                         "priceLabel": "11 SAR",
I/flutter (26929): ║                         "kind": "item",
I/flutter (26929): ║                         "category": "juice",
I/flutter (26929): ║                         "type": "one_time",
I/flutter (26929): ║                         "billingMode": "flat_once",
I/flutter (26929): ║                         "pricingModel": "one_time",
I/flutter (26929): ║                         "billingUnit": "item",
I/flutter (26929): ║                         "ui": {
I/flutter (26929): ║                             "title": "أورانج كاروت",
I/flutter (26929): ║                             "subtitle": "عصير ضمن فئة العصير.",
I/flutter (26929): ║                             "ctaLabel": "أضف",
I/flutter (26929): ║                             "badge": "إضافة مرة واحدة"
I/flutter (26929): ║                        }
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f2399d4eee65376d14b40f",
I/flutter (26929): ║                         "name": "واترميلون منت",
I/flutter (26929): ║                         "description": "عصير ضمن فئة العصير.",
I/flutter (26929): ║                         "imageUrl": "",
I/flutter (26929): ║                         "currency": "SAR",
I/flutter (26929): ║                         "priceHalala": 1100,
I/flutter (26929): ║                         "priceSar": 11,
I/flutter (26929): ║                         "priceLabel": "11 SAR",
I/flutter (26929): ║                         "kind": "item",
I/flutter (26929): ║                         "category": "juice",
I/flutter (26929): ║                         "type": "one_time",
I/flutter (26929): ║                         "billingMode": "flat_once",
I/flutter (26929): ║                         "pricingModel": "one_time",
I/flutter (26929): ║                         "billingUnit": "item",
I/flutter (26929): ║                         "ui": {
I/flutter (26929): ║                             "title": "واترميلون منت",
I/flutter (26929): ║                             "subtitle": "عصير ضمن فئة العصير.",
I/flutter (26929): ║                             "ctaLabel": "أضف",
I/flutter (26929): ║                             "badge": "إضافة مرة واحدة"
I/flutter (26929): ║                        }
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f2399d4eee65376d14b410",
I/flutter (26929): ║                         "name": "بروتين درينك",
I/flutter (26929): ║                         "description": "مشروب ضمن فئة العصير.",
I/flutter (26929): ║                         "imageUrl": "",
I/flutter (26929): ║                         "currency": "SAR",
I/flutter (26929): ║                         "priceHalala": 1900,
I/flutter (26929): ║                         "priceSar": 19,
I/flutter (26929): ║                         "priceLabel": "19 SAR",
I/flutter (26929): ║                         "kind": "item",
I/flutter (26929): ║                         "category": "juice",
I/flutter (26929): ║                         "type": "one_time",
I/flutter (26929): ║                         "billingMode": "flat_once",
I/flutter (26929): ║                         "pricingModel": "one_time",
I/flutter (26929): ║                         "billingUnit": "item",
I/flutter (26929): ║                         "ui": {
I/flutter (26929): ║                             "title": "بروتين درينك",
I/flutter (26929): ║                             "subtitle": "مشروب ضمن فئة العصير.",
I/flutter (26929): ║                             "ctaLabel": "أضف",
I/flutter (26929): ║                             "badge": "إضافة مرة واحدة"
I/flutter (26929): ║                        }
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f2399d4eee65376d14b411",
I/flutter (26929): ║                         "name": "دايت آيسد تي",
I/flutter (26929): ║                         "description": "مشروب ضمن فئة العصير.",
I/flutter (26929): ║                         "imageUrl": "",
I/flutter (26929): ║                         "currency": "SAR",
I/flutter (26929): ║                         "priceHalala": 400,
I/flutter (26929): ║                         "priceSar": 4,
I/flutter (26929): ║                         "priceLabel": "4 SAR",
I/flutter (26929): ║                         "kind": "item",
I/flutter (26929): ║                         "category": "juice",
I/flutter (26929): ║                         "type": "one_time",
I/flutter (26929): ║                         "billingMode": "flat_once",
I/flutter (26929): ║                         "pricingModel": "one_time",
I/flutter (26929): ║                         "billingUnit": "item",
I/flutter (26929): ║                         "ui": {
I/flutter (26929): ║                             "title": "دايت آيسد تي",
I/flutter (26929): ║                             "subtitle": "مشروب ضمن فئة العصير.",
I/flutter (26929): ║                             "ctaLabel": "أضف",
I/flutter (26929): ║                             "badge": "إضافة مرة واحدة"
I/flutter (26929): ║                        }
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f2399d4eee65376d14b412",
I/flutter (26929): ║                         "name": "دايت صودا",
I/flutter (26929): ║                         "description": "مشروب ضمن فئة العصير.",
I/flutter (26929): ║                         "imageUrl": "",
I/flutter (26929): ║                         "currency": "SAR",
I/flutter (26929): ║                         "priceHalala": 300,
I/flutter (26929): ║                         "priceSar": 3,
I/flutter (26929): ║                         "priceLabel": "3 SAR",
I/flutter (26929): ║                         "kind": "item",
I/flutter (26929): ║                         "category": "juice",
I/flutter (26929): ║                         "type": "one_time",
I/flutter (26929): ║                         "billingMode": "flat_once",
I/flutter (26929): ║                         "pricingModel": "one_time",
I/flutter (26929): ║                         "billingUnit": "item",
I/flutter (26929): ║                         "ui": {
I/flutter (26929): ║                             "title": "دايت صودا",
I/flutter (26929): ║                             "subtitle": "مشروب ضمن فئة العصير.",
I/flutter (26929): ║                             "ctaLabel": "أضف",
I/flutter (26929): ║                             "badge": "إضافة مرة واحدة"
I/flutter (26929): ║                        }
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f2399d4eee65376d14b413",
I/flutter (26929): ║                         "name": "ماء",
I/flutter (26929): ║                         "description": "مياه ضمن فئة العصير.",
I/flutter (26929): ║                         "imageUrl": "",
I/flutter (26929): ║                         "currency": "SAR",
I/flutter (26929): ║                         "priceHalala": 200,
I/flutter (26929): ║                         "priceSar": 2,
I/flutter (26929): ║                         "priceLabel": "2 SAR",
I/flutter (26929): ║                         "kind": "item",
I/flutter (26929): ║                         "category": "juice",
I/flutter (26929): ║                         "type": "one_time",
I/flutter (26929): ║                         "billingMode": "flat_once",
I/flutter (26929): ║                         "pricingModel": "one_time",
I/flutter (26929): ║                         "billingUnit": "item",
I/flutter (26929): ║                         "ui": {title: ماء, subtitle: مياه ضمن فئة العصير., ctaLabel: أضف, badge: إضافة مرة واحدة}
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f2399d4eee65376d14b414",
I/flutter (26929): ║                         "name": "مافن تفاح بالقرفة (قطعتان)",
I/flutter (26929): ║                         "description": "سناك ضمن فئة السناك.",
I/flutter (26929): ║                         "imageUrl": "",
I/flutter (26929): ║                         "currency": "SAR",
I/flutter (26929): ║                         "priceHalala": 1200,
I/flutter (26929): ║                         "priceSar": 12,
I/flutter (26929): ║                         "priceLabel": "12 SAR",
I/flutter (26929): ║                         "kind": "item",
I/flutter (26929): ║                         "category": "snack",
I/flutter (26929): ║                         "type": "one_time",
I/flutter (26929): ║                         "billingMode": "flat_once",
I/flutter (26929): ║                         "pricingModel": "one_time",
I/flutter (26929): ║                         "billingUnit": "item",
I/flutter (26929): ║                         "ui": {
I/flutter (26929): ║                             "title": "مافن تفاح بالقرفة (قطعتان)",
I/flutter (26929): ║                             "subtitle": "سناك ضمن فئة السناك.",
I/flutter (26929): ║                             "ctaLabel": "أضف",
I/flutter (26929): ║                             "badge": "إضافة مرة واحدة"
I/flutter (26929): ║                        }
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f2399d4eee65376d14b415",
I/flutter (26929): ║                         "name": "بلو بيري تشيزكيك",
I/flutter (26929): ║                         "description": "سناك ضمن فئة السناك.",
I/flutter (26929): ║                         "imageUrl": "",
I/flutter (26929): ║                         "currency": "SAR",
I/flutter (26929): ║                         "priceHalala": 1900,
I/flutter (26929): ║                         "priceSar": 19,
I/flutter (26929): ║                         "priceLabel": "19 SAR",
I/flutter (26929): ║                         "kind": "item",
I/flutter (26929): ║                         "category": "snack",
I/flutter (26929): ║                         "type": "one_time",
I/flutter (26929): ║                         "billingMode": "flat_once",
I/flutter (26929): ║                         "pricingModel": "one_time",
I/flutter (26929): ║                         "billingUnit": "item",
I/flutter (26929): ║                         "ui": {
I/flutter (26929): ║                             "title": "بلو بيري تشيزكيك",
I/flutter (26929): ║                             "subtitle": "سناك ضمن فئة السناك.",
I/flutter (26929): ║                             "ctaLabel": "أضف",
I/flutter (26929): ║                             "badge": "إضافة مرة واحدة"
I/flutter (26929): ║                        }
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f2399d4eee65376d14b416",
I/flutter (26929): ║                         "name": "ستروبيري تشيزكيك",
I/flutter (26929): ║                         "description": "سناك ضمن فئة السناك.",
I/flutter (26929): ║                         "imageUrl": "",
I/flutter (26929): ║                         "currency": "SAR",
I/flutter (26929): ║                         "priceHalala": 1900,
I/flutter (26929): ║                         "priceSar": 19,
I/flutter (26929): ║                         "priceLabel": "19 SAR",
I/flutter (26929): ║                         "kind": "item",
I/flutter (26929): ║                         "category": "snack",
I/flutter (26929): ║                         "type": "one_time",
I/flutter (26929): ║                         "billingMode": "flat_once",
I/flutter (26929): ║                         "pricingModel": "one_time",
I/flutter (26929): ║                         "billingUnit": "item",
I/flutter (26929): ║                         "ui": {
I/flutter (26929): ║                             "title": "ستروبيري تشيزكيك",
I/flutter (26929): ║                             "subtitle": "سناك ضمن فئة السناك.",
I/flutter (26929): ║                             "ctaLabel": "أضف",
I/flutter (26929): ║                             "badge": "إضافة مرة واحدة"
I/flutter (26929): ║                        }
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f2399d4eee65376d14b417",
I/flutter (26929): ║                         "name": "دارك براونيز",
I/flutter (26929): ║                         "description": "سناك ضمن فئة السناك.",
I/flutter (26929): ║                         "imageUrl": "",
I/flutter (26929): ║                         "currency": "SAR",
I/flutter (26929): ║                         "priceHalala": 1300,
I/flutter (26929): ║                         "priceSar": 13,
I/flutter (26929): ║                         "priceLabel": "13 SAR",
I/flutter (26929): ║                         "kind": "item",
I/flutter (26929): ║                         "category": "snack",
I/flutter (26929): ║                         "type": "one_time",
I/flutter (26929): ║                         "billingMode": "flat_once",
I/flutter (26929): ║                         "pricingModel": "one_time",
I/flutter (26929): ║                         "billingUnit": "item",
I/flutter (26929): ║                         "ui": {
I/flutter (26929): ║                             "title": "دارك براونيز",
I/flutter (26929): ║                             "subtitle": "سناك ضمن فئة السناك.",
I/flutter (26929): ║                             "ctaLabel": "أضف",
I/flutter (26929): ║                             "badge": "إضافة مرة واحدة"
I/flutter (26929): ║                        }
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f2399d4eee65376d14b418",
I/flutter (26929): ║                         "name": "بروتين بار",
I/flutter (26929): ║                         "description": "سناك ضمن فئة السناك.",
I/flutter (26929): ║                         "imageUrl": "",
I/flutter (26929): ║                         "currency": "SAR",
I/flutter (26929): ║                         "priceHalala": 1500,
I/flutter (26929): ║                         "priceSar": 15,
I/flutter (26929): ║                         "priceLabel": "15 SAR",
I/flutter (26929): ║                         "kind": "item",
I/flutter (26929): ║                         "category": "snack",
I/flutter (26929): ║                         "type": "one_time",
I/flutter (26929): ║                         "billingMode": "flat_once",
I/flutter (26929): ║                         "pricingModel": "one_time",
I/flutter (26929): ║                         "billingUnit": "item",
I/flutter (26929): ║                         "ui": {
I/flutter (26929): ║                             "title": "بروتين بار",
I/flutter (26929): ║                             "subtitle": "سناك ضمن فئة السناك.",
I/flutter (26929): ║                             "ctaLabel": "أضف",
I/flutter (26929): ║                             "badge": "إضافة مرة واحدة"
I/flutter (26929): ║                        }
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f2399d4eee65376d14b419",
I/flutter (26929): ║                         "name": "كلاسيك بيسك",
I/flutter (26929): ║                         "description": "سناك ضمن فئة السناك.",
I/flutter (26929): ║                         "imageUrl": "",
I/flutter (26929): ║                         "currency": "SAR",
I/flutter (26929): ║                         "priceHalala": 1400,
I/flutter (26929): ║                         "priceSar": 14,
I/flutter (26929): ║                         "priceLabel": "14 SAR",
I/flutter (26929): ║                         "kind": "item",
I/flutter (26929): ║                         "category": "snack",
I/flutter (26929): ║                         "type": "one_time",
I/flutter (26929): ║                         "billingMode": "flat_once",
I/flutter (26929): ║                         "pricingModel": "one_time",
I/flutter (26929): ║                         "billingUnit": "item",
I/flutter (26929): ║                         "ui": {
I/flutter (26929): ║                             "title": "كلاسيك بيسك",
I/flutter (26929): ║                             "subtitle": "سناك ضمن فئة السناك.",
I/flutter (26929): ║                             "ctaLabel": "أضف",
I/flutter (26929): ║                             "badge": "إضافة مرة واحدة"
I/flutter (26929): ║                        }
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f2399d4eee65376d14b41a",
I/flutter (26929): ║                         "name": "كيكة بروتين بالشوكولاتة",
I/flutter (26929): ║                         "description": "سناك ضمن فئة السناك.",
I/flutter (26929): ║                         "imageUrl": "",
I/flutter (26929): ║                         "currency": "SAR",
I/flutter (26929): ║                         "priceHalala": 400,
I/flutter (26929): ║                         "priceSar": 4,
I/flutter (26929): ║                         "priceLabel": "4 SAR",
I/flutter (26929): ║                         "kind": "item",
I/flutter (26929): ║                         "category": "snack",
I/flutter (26929): ║                         "type": "one_time",
I/flutter (26929): ║                         "billingMode": "flat_once",
I/flutter (26929): ║                         "pricingModel": "one_time",
I/flutter (26929): ║                         "billingUnit": "item",
I/flutter (26929): ║                         "ui": {
I/flutter (26929): ║                             "title": "كيكة بروتين بالشوكولاتة",
I/flutter (26929): ║                             "subtitle": "سناك ضمن فئة السناك.",
I/flutter (26929): ║                             "ctaLabel": "أضف",
I/flutter (26929): ║                             "badge": "إضافة مرة واحدة"
I/flutter (26929): ║                        }
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "id": "69f2399d4eee65376d14b41b",
I/flutter (26929): ║                         "name": "سلطة صغيرة",
I/flutter (26929): ║                         "description": "سلطة ضمن فئة السلطة الصغيرة.",
I/flutter (26929): ║                         "imageUrl": "",
I/flutter (26929): ║                         "currency": "SAR",
I/flutter (26929): ║                         "priceHalala": 1200,
I/flutter (26929): ║                         "priceSar": 12,
I/flutter (26929): ║                         "priceLabel": "12 SAR",
I/flutter (26929): ║                         "kind": "item",
I/flutter (26929): ║                         "category": "small_salad",
I/flutter (26929): ║                         "type": "one_time",
I/flutter (26929): ║                         "billingMode": "flat_once",
I/flutter (26929): ║                         "pricingModel": "one_time",
I/flutter (26929): ║                         "billingUnit": "item",
I/flutter (26929): ║                         "ui": {
I/flutter (26929): ║                             "title": "سلطة صغيرة",
I/flutter (26929): ║                             "subtitle": "سلطة ضمن فئة السلطة الصغيرة.",
I/flutter (26929): ║                             "ctaLabel": "أضف",
I/flutter (26929): ║                             "badge": "إضافة مرة واحدة"
I/flutter (26929): ║                        }
I/flutter (26929): ║                    }
I/flutter (26929): ║                 ],
I/flutter (26929): ║                 "byCategory": {
I/flutter (26929): ║                     "juice": [
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f2399d4eee65376d14b40a",
I/flutter (26929): ║                             "name": "بيري بلاست",
I/flutter (26929): ║                             "description": "عصير ضمن فئة العصير.",
I/flutter (26929): ║                             "imageUrl": "",
I/flutter (26929): ║                             "currency": "SAR",
I/flutter (26929): ║                             "priceHalala": 1100,
I/flutter (26929): ║                             "priceSar": 11,
I/flutter (26929): ║                             "priceLabel": "11 SAR",
I/flutter (26929): ║                             "kind": "item",
I/flutter (26929): ║                             "category": "juice",
I/flutter (26929): ║                             "type": "one_time",
I/flutter (26929): ║                             "billingMode": "flat_once",
I/flutter (26929): ║                             "pricingModel": "one_time",
I/flutter (26929): ║                             "billingUnit": "item",
I/flutter (26929): ║                             "ui": {
I/flutter (26929): ║                                 "title": "بيري بلاست",
I/flutter (26929): ║                                 "subtitle": "عصير ضمن فئة العصير.",
I/flutter (26929): ║                                 "ctaLabel": "أضف",
I/flutter (26929): ║                                 "badge": "إضافة مرة واحدة"
I/flutter (26929): ║                            }
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f2399d4eee65376d14b40b",
I/flutter (26929): ║                             "name": "بيري بروت",
I/flutter (26929): ║                             "description": "عصير ضمن فئة العصير.",
I/flutter (26929): ║                             "imageUrl": "",
I/flutter (26929): ║                             "currency": "SAR",
I/flutter (26929): ║                             "priceHalala": 1300,
I/flutter (26929): ║                             "priceSar": 13,
I/flutter (26929): ║                             "priceLabel": "13 SAR",
I/flutter (26929): ║                             "kind": "item",
I/flutter (26929): ║                             "category": "juice",
I/flutter (26929): ║                             "type": "one_time",
I/flutter (26929): ║                             "billingMode": "flat_once",
I/flutter (26929): ║                             "pricingModel": "one_time",
I/flutter (26929): ║                             "billingUnit": "item",
I/flutter (26929): ║                             "ui": {title: بيري بروت, subtitle: عصير ضمن فئة العصير., ctaLabel: أضف, badge: إضافة مرة واحدة}
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f2399d4eee65376d14b40c",
I/flutter (26929): ║                             "name": "كلاسيك جرين",
I/flutter (26929): ║                             "description": "عصير ضمن فئة العصير.",
I/flutter (26929): ║                             "imageUrl": "",
I/flutter (26929): ║                             "currency": "SAR",
I/flutter (26929): ║                             "priceHalala": 1100,
I/flutter (26929): ║                             "priceSar": 11,
I/flutter (26929): ║                             "priceLabel": "11 SAR",
I/flutter (26929): ║                             "kind": "item",
I/flutter (26929): ║                             "category": "juice",
I/flutter (26929): ║                             "type": "one_time",
I/flutter (26929): ║                             "billingMode": "flat_once",
I/flutter (26929): ║                             "pricingModel": "one_time",
I/flutter (26929): ║                             "billingUnit": "item",
I/flutter (26929): ║                             "ui": {
I/flutter (26929): ║                                 "title": "كلاسيك جرين",
I/flutter (26929): ║                                 "subtitle": "عصير ضمن فئة العصير.",
I/flutter (26929): ║                                 "ctaLabel": "أضف",
I/flutter (26929): ║                                 "badge": "إضافة مرة واحدة"
I/flutter (26929): ║                            }
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f2399d4eee65376d14b40d",
I/flutter (26929): ║                             "name": "بيت بانش",
I/flutter (26929): ║                             "description": "عصير ضمن فئة العصير.",
I/flutter (26929): ║                             "imageUrl": "",
I/flutter (26929): ║                             "currency": "SAR",
I/flutter (26929): ║                             "priceHalala": 1100,
I/flutter (26929): ║                             "priceSar": 11,
I/flutter (26929): ║                             "priceLabel": "11 SAR",
I/flutter (26929): ║                             "kind": "item",
I/flutter (26929): ║                             "category": "juice",
I/flutter (26929): ║                             "type": "one_time",
I/flutter (26929): ║                             "billingMode": "flat_once",
I/flutter (26929): ║                             "pricingModel": "one_time",
I/flutter (26929): ║                             "billingUnit": "item",
I/flutter (26929): ║                             "ui": {title: بيت بانش, subtitle: عصير ضمن فئة العصير., ctaLabel: أضف, badge: إضافة مرة واحدة}
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f2399d4eee65376d14b40e",
I/flutter (26929): ║                             "name": "أورانج كاروت",
I/flutter (26929): ║                             "description": "عصير ضمن فئة العصير.",
I/flutter (26929): ║                             "imageUrl": "",
I/flutter (26929): ║                             "currency": "SAR",
I/flutter (26929): ║                             "priceHalala": 1100,
I/flutter (26929): ║                             "priceSar": 11,
I/flutter (26929): ║                             "priceLabel": "11 SAR",
I/flutter (26929): ║                             "kind": "item",
I/flutter (26929): ║                             "category": "juice",
I/flutter (26929): ║                             "type": "one_time",
I/flutter (26929): ║                             "billingMode": "flat_once",
I/flutter (26929): ║                             "pricingModel": "one_time",
I/flutter (26929): ║                             "billingUnit": "item",
I/flutter (26929): ║                             "ui": {
I/flutter (26929): ║                                 "title": "أورانج كاروت",
I/flutter (26929): ║                                 "subtitle": "عصير ضمن فئة العصير.",
I/flutter (26929): ║                                 "ctaLabel": "أضف",
I/flutter (26929): ║                                 "badge": "إضافة مرة واحدة"
I/flutter (26929): ║                            }
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f2399d4eee65376d14b40f",
I/flutter (26929): ║                             "name": "واترميلون منت",
I/flutter (26929): ║                             "description": "عصير ضمن فئة العصير.",
I/flutter (26929): ║                             "imageUrl": "",
I/flutter (26929): ║                             "currency": "SAR",
I/flutter (26929): ║                             "priceHalala": 1100,
I/flutter (26929): ║                             "priceSar": 11,
I/flutter (26929): ║                             "priceLabel": "11 SAR",
I/flutter (26929): ║                             "kind": "item",
I/flutter (26929): ║                             "category": "juice",
I/flutter (26929): ║                             "type": "one_time",
I/flutter (26929): ║                             "billingMode": "flat_once",
I/flutter (26929): ║                             "pricingModel": "one_time",
I/flutter (26929): ║                             "billingUnit": "item",
I/flutter (26929): ║                             "ui": {
I/flutter (26929): ║                                 "title": "واترميلون منت",
I/flutter (26929): ║                                 "subtitle": "عصير ضمن فئة العصير.",
I/flutter (26929): ║                                 "ctaLabel": "أضف",
I/flutter (26929): ║                                 "badge": "إضافة مرة واحدة"
I/flutter (26929): ║                            }
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f2399d4eee65376d14b410",
I/flutter (26929): ║                             "name": "بروتين درينك",
I/flutter (26929): ║                             "description": "مشروب ضمن فئة العصير.",
I/flutter (26929): ║                             "imageUrl": "",
I/flutter (26929): ║                             "currency": "SAR",
I/flutter (26929): ║                             "priceHalala": 1900,
I/flutter (26929): ║                             "priceSar": 19,
I/flutter (26929): ║                             "priceLabel": "19 SAR",
I/flutter (26929): ║                             "kind": "item",
I/flutter (26929): ║                             "category": "juice",
I/flutter (26929): ║                             "type": "one_time",
I/flutter (26929): ║                             "billingMode": "flat_once",
I/flutter (26929): ║                             "pricingModel": "one_time",
I/flutter (26929): ║                             "billingUnit": "item",
I/flutter (26929): ║                             "ui": {
I/flutter (26929): ║                                 "title": "بروتين درينك",
I/flutter (26929): ║                                 "subtitle": "مشروب ضمن فئة العصير.",
I/flutter (26929): ║                                 "ctaLabel": "أضف",
I/flutter (26929): ║                                 "badge": "إضافة مرة واحدة"
I/flutter (26929): ║                            }
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f2399d4eee65376d14b411",
I/flutter (26929): ║                             "name": "دايت آيسد تي",
I/flutter (26929): ║                             "description": "مشروب ضمن فئة العصير.",
I/flutter (26929): ║                             "imageUrl": "",
I/flutter (26929): ║                             "currency": "SAR",
I/flutter (26929): ║                             "priceHalala": 400,
I/flutter (26929): ║                             "priceSar": 4,
I/flutter (26929): ║                             "priceLabel": "4 SAR",
I/flutter (26929): ║                             "kind": "item",
I/flutter (26929): ║                             "category": "juice",
I/flutter (26929): ║                             "type": "one_time",
I/flutter (26929): ║                             "billingMode": "flat_once",
I/flutter (26929): ║                             "pricingModel": "one_time",
I/flutter (26929): ║                             "billingUnit": "item",
I/flutter (26929): ║                             "ui": {
I/flutter (26929): ║                                 "title": "دايت آيسد تي",
I/flutter (26929): ║                                 "subtitle": "مشروب ضمن فئة العصير.",
I/flutter (26929): ║                                 "ctaLabel": "أضف",
I/flutter (26929): ║                                 "badge": "إضافة مرة واحدة"
I/flutter (26929): ║                            }
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f2399d4eee65376d14b412",
I/flutter (26929): ║                             "name": "دايت صودا",
I/flutter (26929): ║                             "description": "مشروب ضمن فئة العصير.",
I/flutter (26929): ║                             "imageUrl": "",
I/flutter (26929): ║                             "currency": "SAR",
I/flutter (26929): ║                             "priceHalala": 300,
I/flutter (26929): ║                             "priceSar": 3,
I/flutter (26929): ║                             "priceLabel": "3 SAR",
I/flutter (26929): ║                             "kind": "item",
I/flutter (26929): ║                             "category": "juice",
I/flutter (26929): ║                             "type": "one_time",
I/flutter (26929): ║                             "billingMode": "flat_once",
I/flutter (26929): ║                             "pricingModel": "one_time",
I/flutter (26929): ║                             "billingUnit": "item",
I/flutter (26929): ║                             "ui": {
I/flutter (26929): ║                                 "title": "دايت صودا",
I/flutter (26929): ║                                 "subtitle": "مشروب ضمن فئة العصير.",
I/flutter (26929): ║                                 "ctaLabel": "أضف",
I/flutter (26929): ║                                 "badge": "إضافة مرة واحدة"
I/flutter (26929): ║                            }
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f2399d4eee65376d14b413",
I/flutter (26929): ║                             "name": "ماء",
I/flutter (26929): ║                             "description": "مياه ضمن فئة العصير.",
I/flutter (26929): ║                             "imageUrl": "",
I/flutter (26929): ║                             "currency": "SAR",
I/flutter (26929): ║                             "priceHalala": 200,
I/flutter (26929): ║                             "priceSar": 2,
I/flutter (26929): ║                             "priceLabel": "2 SAR",
I/flutter (26929): ║                             "kind": "item",
I/flutter (26929): ║                             "category": "juice",
I/flutter (26929): ║                             "type": "one_time",
I/flutter (26929): ║                             "billingMode": "flat_once",
I/flutter (26929): ║                             "pricingModel": "one_time",
I/flutter (26929): ║                             "billingUnit": "item",
I/flutter (26929): ║                             "ui": {title: ماء, subtitle: مياه ضمن فئة العصير., ctaLabel: أضف, badge: إضافة مرة واحدة}
I/flutter (26929): ║                        }
I/flutter (26929): ║                     ],
I/flutter (26929): ║                     "snack": [
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f2399d4eee65376d14b414",
I/flutter (26929): ║                             "name": "مافن تفاح بالقرفة (قطعتان)",
I/flutter (26929): ║                             "description": "سناك ضمن فئة السناك.",
I/flutter (26929): ║                             "imageUrl": "",
I/flutter (26929): ║                             "currency": "SAR",
I/flutter (26929): ║                             "priceHalala": 1200,
I/flutter (26929): ║                             "priceSar": 12,
I/flutter (26929): ║                             "priceLabel": "12 SAR",
I/flutter (26929): ║                             "kind": "item",
I/flutter (26929): ║                             "category": "snack",
I/flutter (26929): ║                             "type": "one_time",
I/flutter (26929): ║                             "billingMode": "flat_once",
I/flutter (26929): ║                             "pricingModel": "one_time",
I/flutter (26929): ║                             "billingUnit": "item",
I/flutter (26929): ║                             "ui": {
I/flutter (26929): ║                                 "title": "مافن تفاح بالقرفة (قطعتان)"
I/flutter (26929): ║                                 "subtitle": "سناك ضمن فئة السناك.",
I/flutter (26929): ║                                 "ctaLabel": "أضف",
I/flutter (26929): ║                                 "badge": "إضافة مرة واحدة"
I/flutter (26929): ║                            }
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f2399d4eee65376d14b415",
I/flutter (26929): ║                             "name": "بلو بيري تشيزكيك",
I/flutter (26929): ║                             "description": "سناك ضمن فئة السناك.",
I/flutter (26929): ║                             "imageUrl": "",
I/flutter (26929): ║                             "currency": "SAR",
I/flutter (26929): ║                             "priceHalala": 1900,
I/flutter (26929): ║                             "priceSar": 19,
I/flutter (26929): ║                             "priceLabel": "19 SAR",
I/flutter (26929): ║                             "kind": "item",
I/flutter (26929): ║                             "category": "snack",
I/flutter (26929): ║                             "type": "one_time",
I/flutter (26929): ║                             "billingMode": "flat_once",
I/flutter (26929): ║                             "pricingModel": "one_time",
I/flutter (26929): ║                             "billingUnit": "item",
I/flutter (26929): ║                             "ui": {
I/flutter (26929): ║                                 "title": "بلو بيري تشيزكيك",
I/flutter (26929): ║                                 "subtitle": "سناك ضمن فئة السناك.",
I/flutter (26929): ║                                 "ctaLabel": "أضف",
I/flutter (26929): ║                                 "badge": "إضافة مرة واحدة"
I/flutter (26929): ║                            }
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f2399d4eee65376d14b416",
I/flutter (26929): ║                             "name": "ستروبيري تشيزكيك",
I/flutter (26929): ║                             "description": "سناك ضمن فئة السناك.",
I/flutter (26929): ║                             "imageUrl": "",
I/flutter (26929): ║                             "currency": "SAR",
I/flutter (26929): ║                             "priceHalala": 1900,
I/flutter (26929): ║                             "priceSar": 19,
I/flutter (26929): ║                             "priceLabel": "19 SAR",
I/flutter (26929): ║                             "kind": "item",
I/flutter (26929): ║                             "category": "snack",
I/flutter (26929): ║                             "type": "one_time",
I/flutter (26929): ║                             "billingMode": "flat_once",
I/flutter (26929): ║                             "pricingModel": "one_time",
I/flutter (26929): ║                             "billingUnit": "item",
I/flutter (26929): ║                             "ui": {
I/flutter (26929): ║                                 "title": "ستروبيري تشيزكيك",
I/flutter (26929): ║                                 "subtitle": "سناك ضمن فئة السناك.",
I/flutter (26929): ║                                 "ctaLabel": "أضف",
I/flutter (26929): ║                                 "badge": "إضافة مرة واحدة"
I/flutter (26929): ║                            }
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f2399d4eee65376d14b417",
I/flutter (26929): ║                             "name": "دارك براونيز",
I/flutter (26929): ║                             "description": "سناك ضمن فئة السناك.",
I/flutter (26929): ║                             "imageUrl": "",
I/flutter (26929): ║                             "currency": "SAR",
I/flutter (26929): ║                             "priceHalala": 1300,
I/flutter (26929): ║                             "priceSar": 13,
I/flutter (26929): ║                             "priceLabel": "13 SAR",
I/flutter (26929): ║                             "kind": "item",
I/flutter (26929): ║                             "category": "snack",
I/flutter (26929): ║                             "type": "one_time",
I/flutter (26929): ║                             "billingMode": "flat_once",
I/flutter (26929): ║                             "pricingModel": "one_time",
I/flutter (26929): ║                             "billingUnit": "item",
I/flutter (26929): ║                             "ui": {
I/flutter (26929): ║                                 "title": "دارك براونيز",
I/flutter (26929): ║                                 "subtitle": "سناك ضمن فئة السناك.",
I/flutter (26929): ║                                 "ctaLabel": "أضف",
I/flutter (26929): ║                                 "badge": "إضافة مرة واحدة"
I/flutter (26929): ║                            }
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f2399d4eee65376d14b418",
I/flutter (26929): ║                             "name": "بروتين بار",
I/flutter (26929): ║                             "description": "سناك ضمن فئة السناك.",
I/flutter (26929): ║                             "imageUrl": "",
I/flutter (26929): ║                             "currency": "SAR",
I/flutter (26929): ║                             "priceHalala": 1500,
I/flutter (26929): ║                             "priceSar": 15,
I/flutter (26929): ║                             "priceLabel": "15 SAR",
I/flutter (26929): ║                             "kind": "item",
I/flutter (26929): ║                             "category": "snack",
I/flutter (26929): ║                             "type": "one_time",
I/flutter (26929): ║                             "billingMode": "flat_once",
I/flutter (26929): ║                             "pricingModel": "one_time",
I/flutter (26929): ║                             "billingUnit": "item",
I/flutter (26929): ║                             "ui": {
I/flutter (26929): ║                                 "title": "بروتين بار",
I/flutter (26929): ║                                 "subtitle": "سناك ضمن فئة السناك.",
I/flutter (26929): ║                                 "ctaLabel": "أضف",
I/flutter (26929): ║                                 "badge": "إضافة مرة واحدة"
I/flutter (26929): ║                            }
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f2399d4eee65376d14b419",
I/flutter (26929): ║                             "name": "كلاسيك بيسك",
I/flutter (26929): ║                             "description": "سناك ضمن فئة السناك.",
I/flutter (26929): ║                             "imageUrl": "",
I/flutter (26929): ║                             "currency": "SAR",
I/flutter (26929): ║                             "priceHalala": 1400,
I/flutter (26929): ║                             "priceSar": 14,
I/flutter (26929): ║                             "priceLabel": "14 SAR",
I/flutter (26929): ║                             "kind": "item",
I/flutter (26929): ║                             "category": "snack",
I/flutter (26929): ║                             "type": "one_time",
I/flutter (26929): ║                             "billingMode": "flat_once",
I/flutter (26929): ║                             "pricingModel": "one_time",
I/flutter (26929): ║                             "billingUnit": "item",
I/flutter (26929): ║                             "ui": {
I/flutter (26929): ║                                 "title": "كلاسيك بيسك",
I/flutter (26929): ║                                 "subtitle": "سناك ضمن فئة السناك.",
I/flutter (26929): ║                                 "ctaLabel": "أضف",
I/flutter (26929): ║                                 "badge": "إضافة مرة واحدة"
I/flutter (26929): ║                            }
I/flutter (26929): ║                        },
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f2399d4eee65376d14b41a",
I/flutter (26929): ║                             "name": "كيكة بروتين بالشوكولاتة",
I/flutter (26929): ║                             "description": "سناك ضمن فئة السناك.",
I/flutter (26929): ║                             "imageUrl": "",
I/flutter (26929): ║                             "currency": "SAR",
I/flutter (26929): ║                             "priceHalala": 400,
I/flutter (26929): ║                             "priceSar": 4,
I/flutter (26929): ║                             "priceLabel": "4 SAR",
I/flutter (26929): ║                             "kind": "item",
I/flutter (26929): ║                             "category": "snack",
I/flutter (26929): ║                             "type": "one_time",
I/flutter (26929): ║                             "billingMode": "flat_once",
I/flutter (26929): ║                             "pricingModel": "one_time",
I/flutter (26929): ║                             "billingUnit": "item",
I/flutter (26929): ║                             "ui": {
I/flutter (26929): ║                                 "title": "كيكة بروتين بالشوكولاتة",
I/flutter (26929): ║                                 "subtitle": "سناك ضمن فئة السناك.",
I/flutter (26929): ║                                 "ctaLabel": "أضف",
I/flutter (26929): ║                                 "badge": "إضافة مرة واحدة"
I/flutter (26929): ║                            }
I/flutter (26929): ║                        }
I/flutter (26929): ║                     ],
I/flutter (26929): ║                     "small_salad": [
I/flutter (26929): ║                        {
I/flutter (26929): ║                             "id": "69f2399d4eee65376d14b41b",
I/flutter (26929): ║                             "name": "سلطة صغيرة",
I/flutter (26929): ║                             "description": "سلطة ضمن فئة السلطة الصغيرة.",
I/flutter (26929): ║                             "imageUrl": "",
I/flutter (26929): ║                             "currency": "SAR",
I/flutter (26929): ║                             "priceHalala": 1200,
I/flutter (26929): ║                             "priceSar": 12,
I/flutter (26929): ║                             "priceLabel": "12 SAR",
I/flutter (26929): ║                             "kind": "item",
I/flutter (26929): ║                             "category": "small_salad",
I/flutter (26929): ║                             "type": "one_time",
I/flutter (26929): ║                             "billingMode": "flat_once",
I/flutter (26929): ║                             "pricingModel": "one_time",
I/flutter (26929): ║                             "billingUnit": "item",
I/flutter (26929): ║                             "ui": {
I/flutter (26929): ║                                 "title": "سلطة صغيرة",
I/flutter (26929): ║                                 "subtitle": "سلطة ضمن فئة السلطة الصغيرة."
I/flutter (26929): ║                                 "ctaLabel": "أضف",
I/flutter (26929): ║                                 "badge": "إضافة مرة واحدة"
I/flutter (26929): ║                            }
I/flutter (26929): ║                        }
I/flutter (26929): ║                     ]
I/flutter (26929): ║                }
I/flutter (26929): ║                 "totalCount": 18
I/flutter (26929): ║            }
I/flutter (26929): ║        }
I/flutter (26929): ║    }
I/flutter (26929): ║
I/flutter (26929): ╚══════════════════════════════════════════════════════════════════════════════════════════╝
I/flutter (26929): onChange -- MealPlannerBloc, Change { currentState: MealPlannerLoading(), nextState: MealPlannerLoaded([Instance of 'TimelineDayModel', Instance of 'TimelineDayModel', Instance of 'TimelineDayModel', Instance of 'TimelineDayModel', Instance of 'TimelineDayModel', Instance of 'TimelineDayModel', Instance of 'TimelineDayModel'], Instance of 'MealPlannerMenuModel', [AddOnModel(69f2399d4eee65376d14b40a, بيري بلاست, juice, عصير ضمن فئة العصير., , SAR, 1100, 11.0, 11 SAR, item, flat_once, one_time, item, AddOnUiModel(بيري بلاست, عصير ضمن فئة العصير., أضف, إضافة مرة واحدة)), AddOnModel(69f2399d4eee65376d14b40b, بيري بروت, juice, عصير ضمن فئة العصير., , SAR, 1300, 13.0, 13 SAR, item, flat_once, one_time, item, AddOnUiModel(بيري بروت, عصير ضمن فئة العصير., أضف, إضافة مرة واحدة)), AddOnModel(69f2399d4eee65376d14b40c, كلاسيك جرين, juice, عصير ضمن فئة العصير., , SAR,
I/flutter (26929):
I/flutter (26929): ╔╣ Request ║ GET
I/flutter (26929): ║  https://basicdiet145.onrender.com/api/subscriptions/69f3a6e75d7207d8b22fd98f/days/2026-05-01
I/flutter (26929): ╚══════════════════════════════════════════════════════════════════════════════════════════╝
I/flutter (26929): ╔ Headers
I/flutter (26929): ╟ accept: application/json
I/flutter (26929): ╟ content-type: application/json
I/flutter (26929): ╟ authorization:
I/flutter (26929): ║ Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2OWYyMzdmMjE5Mjg4ZGJjOWUxNjMxZG
I/flutter (26929): ║ UiLCJyb2xlIjoiY2xpZW50IiwidG9rZW5UeXBlIjoiYXBwX2FjY2VzcyIsImlhdCI6MTc3NzQ5MDg2NSwiZXhwIjox
I/flutter (26929): ║ NzgwMTY5MjY1fQ.wQdMvBRkWrYPGGrvx5HtsUbTO-B9NlayVB5uRMS4rVE
I/flutter (26929): ╟ Accept-Language: ar
I/flutter (26929): ╟ contentType: application/json
I/flutter (26929): ╟ responseType: ResponseType.json
I/flutter (26929): ╟ followRedirects: true
I/flutter (26929): ╟ receiveTimeout: 16:40:00.000000
I/flutter (26929): ╚══════════════════════════════════════════════════════════════════════════════════════════╝
E/libEGL  (26929): called unimplemented OpenGL ES API
I/flutter (26929):
I/flutter (26929): ╔╣ Response ║ GET ║ Status: 200 OK  ║ Time: 1027 ms
I/flutter (26929): ║  https://basicdiet145.onrender.com/api/subscriptions/69f3a6e75d7207d8b22fd98f/days/2026-05-01
I/flutter (26929): ╚══════════════════════════════════════════════════════════════════════════════════════════╝
I/flutter (26929): ╔ Headers
I/flutter (26929): ╟ x-dns-prefetch-control: [off]
I/flutter (26929): ╟ x-render-origin-server: [Render]
I/flutter (26929): ╟ date: [Thu, 30 Apr 2026 19:03:15 GMT]
I/flutter (26929): ╟ transfer-encoding: [chunked]
I/flutter (26929): ╟ origin-agent-cluster: [?1]
I/flutter (26929): ╟ vary: [Origin, Accept-Encoding]
I/flutter (26929): ╟ content-encoding: [gzip]
I/flutter (26929): ╟ server: [cloudflare]
I/flutter (26929): ╟ cross-origin-resource-policy: [same-origin]
I/flutter (26929): ╟ cf-ray: [9f48ce2a7ccbe22c-MRS]
I/flutter (26929): ╟ etag: [W/"1159-HMj1riQCGBFJqqjrDf1CaKjTeXY"]
I/flutter (26929): ╟ x-frame-options: [SAMEORIGIN]
I/flutter (26929): ╟ content-security-policy:
I/flutter (26929): ║ [default-src 'self';base-uri 'self';font-src 'self' https: data:;form-action 'self';frame-
I/flutter (26929): ║ ancestors 'self';img-src 'self' data:;object-src 'none';script-src 'self';script-src-attr
I/flutter (26929): ║ 'none';style-src 'self' https: 'unsafe-inline';upgrade-insecure-requests]
I/flutter (26929): ╟ connection: [keep-alive]
I/flutter (26929): ╟ strict-transport-security: [max-age=15552000; includeSubDomains]
I/flutter (26929): ╟ referrer-policy: [no-referrer]
I/flutter (26929): ╟ cf-cache-status: [DYNAMIC]
I/flutter (26929): ╟ x-permitted-cross-domain-policies: [none]
I/flutter (26929): ╟ content-type: [application/json; charset=utf-8]
I/flutter (26929): ╟ cross-origin-opener-policy: [same-origin]
I/flutter (26929): ╟ rndr-id: [93befbab-c8d0-43b6]
I/flutter (26929): ╟ x-xss-protection: [0]
I/flutter (26929): ╟ access-control-allow-credentials: [true]
I/flutter (26929): ╟ alt-svc: [h3=":443"; ma=86400]
I/flutter (26929): ╟ x-download-options: [noopen]
I/flutter (26929): ╟ x-content-type-options: [nosniff]
I/flutter (26929): ╚══════════════════════════════════════════════════════════════════════════════════════════╝
I/flutter (26929): ╔ Body
I/flutter (26929): ║
I/flutter (26929): ║    {
I/flutter (26929): ║         "status": true,
I/flutter (26929): ║         "data": {
I/flutter (26929): ║             "_id": "69f3a6e85d7207d8b22fd995",
I/flutter (26929): ║             "subscriptionId": "69f3a6e75d7207d8b22fd98f",
I/flutter (26929): ║             "date": "2026-05-01",
I/flutter (26929): ║             "status": "open",
I/flutter (26929): ║             "selections": []
I/flutter (26929): ║             "skippedByUser": false,
I/flutter (26929): ║             "skipCompensated": false,
I/flutter (26929): ║             "assignedByKitchen": false,
I/flutter (26929): ║             "pickupRequested": false,
I/flutter (26929): ║             "pickupRequestedAt": null,
I/flutter (26929): ║             "pickupPreparationStartedAt": null,
I/flutter (26929): ║             "pickupPreparedAt": null,
I/flutter (26929): ║             "pickupCode": null,
I/flutter (26929): ║             "pickupCodeIssuedAt": null,
I/flutter (26929): ║             "pickupVerifiedAt": null,
I/flutter (26929): ║             "pickupVerifiedByDashboardUserId": null,
I/flutter (26929): ║             "pickupNoShowAt": null,
I/flutter (26929): ║             "dayEndConsumptionReason": null,
I/flutter (26929): ║             "cancellationReason": null,
I/flutter (26929): ║             "cancellationCategory": null,
I/flutter (26929): ║             "cancellationNote": null,
I/flutter (26929): ║             "canceledBy": null,
I/flutter (26929): ║             "canceledAt": null,
I/flutter (26929): ║             "creditsDeducted": false,
I/flutter (26929): ║             "autoLocked": false,
I/flutter (26929): ║             "plannerRevisionHash": "b0ddd7e6b9051b1c961aa465baaa398393149b64baaf0d86503e2b7694ca46e4",
I/flutter (26929): ║             "mealReminderSentAt": null,
I/flutter (26929): ║             "addonSelections": []
I/flutter (26929): ║             "premiumUpgradeSelections": []
I/flutter (26929): ║             "operationAuditLog": []
I/flutter (26929): ║             "customSalads": []
I/flutter (26929): ║             "customMeals": []
I/flutter (26929): ║             "baseMealSlots": []
I/flutter (26929): ║             "__v": 0,
I/flutter (26929): ║             "createdAt": "2026-04-30T19:00:56.107Z",
I/flutter (26929): ║             "updatedAt": "2026-04-30T19:00:56.107Z",
I/flutter (26929): ║             "planning": {
I/flutter (26929): ║                 "version": "subscription_day_planning.v1",
I/flutter (26929): ║                 "state": "draft",
I/flutter (26929): ║                 "requiredMealCount": 1,
I/flutter (26929): ║                 "selectedBaseMealCount": 0,
I/flutter (26929): ║                 "selectedPremiumMealCount": 0,
I/flutter (26929): ║                 "selectedTotalMealCount": 0,
I/flutter (26929): ║                 "isExactCountSatisfied": false,
I/flutter (26929): ║                 "confirmedAt": null,
I/flutter (26929): ║                 "confirmedByRole": null,
I/flutter (26929): ║                 "baseMealSlots": []
I/flutter (26929): ║                 "premiumOverageCount": 0,
I/flutter (26929): ║                 "premiumOverageStatus": null,
I/flutter (26929): ║                 "stateLabel": "مسودة",
I/flutter (26929): ║                 "premiumOverageStatusLabel": ""
I/flutter (26929): ║            }
I/flutter (26929): ║             "statusLabel": "مفتوح",
I/flutter (26929): ║             "premiumSummary": {
I/flutter (26929): ║                 "selectedCount": 0,
I/flutter (26929): ║                 "coveredByBalanceCount": 0,
I/flutter (26929): ║                 "pendingPaymentCount": 0,
I/flutter (26929): ║                 "paidExtraCount": 0,
I/flutter (26929): ║                 "totalExtraHalala": 0,
I/flutter (26929): ║                 "currency": "SAR"
I/flutter (26929): ║            }
I/flutter (26929): ║             "premiumExtraPayment": {
I/flutter (26929): ║                 "status": "none",
I/flutter (26929): ║                 "paymentId": null,
I/flutter (26929): ║                 "providerInvoiceId": null,
I/flutter (26929): ║                 "amountHalala": 0,
I/flutter (26929): ║                 "currency": "SAR",
I/flutter (26929): ║                 "expiresAt": null,
I/flutter (26929): ║                 "reused": false,
I/flutter (26929): ║                 "revisionHash": "b0ddd7e6b9051b1c961aa465baaa398393149b64baaf0d86503e2b7694ca46e4"
I/flutter (26929): ║                 "createdAt": null,
I/flutter (26929): ║                 "paidAt": null,
I/flutter (26929): ║                 "extraPremiumCount": 0,
I/flutter (26929): ║                 "statusLabel": "لا يوجد دفع"
I/flutter (26929): ║            }
I/flutter (26929): ║             "paymentRequirement": {
I/flutter (26929): ║                 "status": "satisfied",
I/flutter (26929): ║                 "requiresPayment": false,
I/flutter (26929): ║                 "pricingStatus": "not_required",
I/flutter (26929): ║                 "blockingReason": "PLANNING_INCOMPLETE",
I/flutter (26929): ║                 "canCreatePayment": false,
I/flutter (26929): ║                 "premiumSelectedCount": 0,
I/flutter (26929): ║                 "premiumPendingPaymentCount": 0,
I/flutter (26929): ║                 "addonSelectedCount": 0,
I/flutter (26929): ║                 "addonPendingPaymentCount": 0,
I/flutter (26929): ║                 "pendingAmountHalala": 0,
I/flutter (26929): ║                 "amountHalala": 0,
I/flutter (26929): ║                 "currency": "SAR",
I/flutter (26929): ║                 "pricingStatusLabel": "غير مطلوب",
I/flutter (26929): ║                 "blockingReasonLabel": ""
I/flutter (26929): ║            }
I/flutter (26929): ║             "commercialState": "draft",
I/flutter (26929): ║             "isFulfillable": false,
I/flutter (26929): ║             "canBePrepared": false,
I/flutter (26929): ║             "pickupPrepared": false,
I/flutter (26929): ║             "pickupPreparationFlowStatus": "waiting_for_prepare",
I/flutter (26929): ║             "fulfillmentMode": "no_service",
I/flutter (26929): ║             "consumptionState": "pending_day",
I/flutter (26929): ║             "requiredMealCount": 1,
I/flutter (26929): ║             "specifiedMealCount": 0,
I/flutter (26929): ║             "unspecifiedMealCount": 1,
I/flutter (26929): ║             "hasCustomerSelections": false,
I/flutter (26929): ║             "requiresMealTypeKnowledge": false,
I/flutter (26929): ║             "mealTypesSpecified": false,
I/flutter (26929): ║             "planningReady": false,
I/flutter (26929): ║             "fulfillmentReady": false,
I/flutter (26929): ║             "deliveryMode": "pickup",
I/flutter (26929): ║             "pickupLocation": null,
I/flutter (26929): ║             "deliveryAddress": null,
I/flutter (26929): ║             "deliveryWindow": null,
I/flutter (26929): ║             "deliverySlot": {type: pickup, slotId: , window: , label: },
I/flutter (26929): ║             "fulfillmentSummary": {
I/flutter (26929): ║                 "mode": "pickup",
I/flutter (26929): ║                 "title": "الاستلام من الفرع",
I/flutter (26929): ║                 "status": "open",
I/flutter (26929): ║                 "statusLabel": "مفتوح",
I/flutter (26929): ║                 "message": "تفاصيل الفرع غير متاحة حاليا",
I/flutter (26929): ║                 "nextAction": "",
I/flutter (26929): ║                 "isEditable": false,
I/flutter (26929): ║                 "isFulfillable": false,
I/flutter (26929): ║                 "planningReady": false,
I/flutter (26929): ║                 "fulfillmentReady": false,
I/flutter (26929): ║                 "lockedReason": "PICKUP_LOCATION_MISSING",
I/flutter (26929): ║                 "lockedMessage": "تفاصيل الفرع غير متاحة حاليا"
I/flutter (26929): ║            }
I/flutter (26929): ║             "lockedReason": "PICKUP_LOCATION_MISSING",
I/flutter (26929): ║             "lockedMessage": "تفاصيل الفرع غير متاحة حاليا",
I/flutter (26929): ║             "rules": {
I/flutter (26929): ║                 "version": "meal_planner_rules.v3",
I/flutter (26929): ║                 "beef": {proteinFamilyKey: beef, maxSlotsPerDay: 1},
I/flutter (26929): ║                 "standardCarbs": {maxTypes: 2, maxTotalGrams: 300, unit: grams},
I/flutter (26929): ║                 "premiumCarbs": {maxTypes: 2, maxTotalGrams: 300, unit: grams},
I/flutter (26929): ║                 "proteinGroups": [
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "key": "chicken",
I/flutter (26929): ║                         "name": {ar: دجاج, en: Chicken},
I/flutter (26929): ║                         "sortOrder": 10
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "key": "beef",
I/flutter (26929): ║                         "name": {ar: لحم, en: Beef},
I/flutter (26929): ║                         "sortOrder": 20
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "key": "fish",
I/flutter (26929): ║                         "name": {ar: أسماك, en: Fish},
I/flutter (26929): ║                         "sortOrder": 30
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "key": "eggs",
I/flutter (26929): ║                         "name": {ar: بيض, en: Eggs},
I/flutter (26929): ║                         "sortOrder": 40
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "key": "premium",
I/flutter (26929): ║                         "name": {ar: بريميوم, en: Premium},
I/flutter (26929): ║                         "sortOrder": 50
I/flutter (26929): ║                    },
I/flutter (26929): ║                    {
I/flutter (26929): ║                         "key": "other",
I/flutter (26929): ║                         "name": {ar: أخرى, en: Other},
I/flutter (26929): ║                         "sortOrder": 60
I/flutter (26929): ║                    }
I/flutter (26929): ║                 ],
I/flutter (26929): ║                 "premiumLargeSalad": {
I/flutter (26929): ║                     "premiumKey": "custom_premium_salad",
I/flutter (26929): ║                     "presetKey": "large_salad",
I/flutter (26929): ║                     "extraFeeHalala": 3000,
I/flutter (26929): ║                     "groups": [
I/flutter (26929): ║                      {key: leafy_greens, minSelect: 0, maxSelect: 99},
I/flutter (26929): ║                      {key: vegetables, minSelect: 0, maxSelect: 99},
I/flutter (26929): ║                      {key: protein, minSelect: 1, maxSelect: 1},
I/flutter (26929): ║                      {key: cheese_nuts, minSelect: 0, maxSelect: 99},
I/flutter (26929): ║                      {key: fruits, minSelect: 0, maxSelect: 99},
I/flutter (26929): ║                      {key: sauce, minSelect: 1, maxSelect: 1}
I/flutter (26929): ║                     ]
I/flutter (26929): ║                }
I/flutter (26929): ║            }
I/flutter (26929): ║             "commercialStateLabel": "مسودة"
I/flutter (26929): ║        }
I/flutter (26929): ║    }
I/flutter (26929): ║
I/flutter (26929): ╚══════════════════════════════════════════════════════════════════════════════════════════╝
I/flutter (26929): onChange -- MealPlannerBloc, Change { currentState: MealPlannerLoaded([Instance of 'TimelineDayModel', Instance of 'TimelineDayModel', Instance of 'TimelineDayModel', Instance of 'TimelineDayModel', Instance of 'TimelineDayModel', Instance of 'TimelineDayModel', Instance of 'TimelineDayModel'], Instance of 'MealPlannerMenuModel', [AddOnModel(69f2399d4eee65376d14b40a, بيري بلاست, juice, عصير ضمن فئة العصير., , SAR, 1100, 11.0, 11 SAR, item, flat_once, one_time, item, AddOnUiModel(بيري بلاست, عصير ضمن فئة العصير., أضف, إضافة مرة واحدة)), AddOnModel(69f2399d4eee65376d14b40b, بيري بروت, juice, عصير ضمن فئة العصير., , SAR, 1300, 13.0, 13 SAR, item, flat_once, one_time, item, AddOnUiModel(بيري بروت, عصير ضمن فئة العصير., أضف, إضافة مرة واحدة)), AddOnModel(69f2399d4eee65376d14b40c, كلاسيك جرين, juice, عصير ضمن فئة العصير., , SAR, 1100, 11.0, 11 SAR, item, flat_o
E/libEGL  (26929): called unimplemented OpenGL ES API
