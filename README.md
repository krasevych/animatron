# Animatron
## Usage

Install `global packages`:
```
node, npm, bower, yeoman, generator-angular-fullstack, grunt
```

Setup project:
```
git clone https://github.com/krasevych/animatron.git

npm install

bower install
```

*if happend some error after commands: npm install or/and bower install - please, try again

develop:
````
grunt serve
````
production:
````
grunt build

grunt serve:dist
````

test:
````
grunt test
````

test for e2e:
````
npm run update-webdriver

grunt test:e2e
````
Documentstions: https://github.com/DaftMonk/generator-angular-fullstack
