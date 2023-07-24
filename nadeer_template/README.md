# Nadeer Flutter Project Brick.

<h2>installation</h2>

<pre>mason add nadeer_template --git-url https://github.com/ma7moud3osman/mason_bricks --git-path ./nadeer_template</pre>

<h2>Usage</h2>

<pre>mason make nadeer_template</pre>

<h2>Structure</h2>

```
├── README.md
├── mason_bricks
 └── nadeer_template
  └── __brick__
     └──{{project_name.snakeCase()}}    
       └── android
       └── assets
       └── ios
       └── lib
          └── core
            └── api 
            └── app 
            └── error 
            └── functions 
            └── injection_function 
            └── network 
            └── routes 
            └── shared_models 
            └── usecases 
            └── utils 
            └── widgets 
          └── features
            └── auth_feature
            └── geteral_screen
            └── upload_image_feature
            └── user_feature
            └── widget
          ├── main.dart
       ├── pubspec.yaml
  ├── CHANGELOG.md
  ├── LICENSE
  ├── README.md
  ├── brick.yaml

```
