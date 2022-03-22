<p align="left">
<img src="https://github.com/Apparence-io/pal-widgets/raw/master/doc/img/pal-showcase.jpg" alt="flutter anchored onboarding screen" />
</p>
<br>
<p align="center">
<a href="https://github.com/Apparence-io/pal-widgets/actions"><img src="https://img.shields.io/github/workflow/status/Apparence-io/pal-widgets/pal-widgets/master" alt="build"></a>
<a href="https://codecov.io/gh/Apparence-io/pal-widgets"><img src="https://codecov.io/gh/Apparence-io/pal-widgets/branch/master/graph/badge.svg?token=M2CACTWTLM"/></a>
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>
<a href="https://pub.dev/packages/pal_widgets"><img src="https://img.shields.io/pub/v/pal_widgets" alt="Pal widgets pubdev"></a>
</p>
<br>

# Pal widgets
A flutter package for better onboarding. 

A set of amazing onboarding widgets for your flutter applications.

## Install package
add in your pubspec.yaml dependencies

```pal-widgets: 0.2.0```

----

## List of helpers

| Name           |      description                             |  status   |
|----------------|----------------------------------------------|-----------|
| AnchoredHelper | An helper do describe another widget of your page. This creates an overlay above your page | :white_check_mark: |

## Anchored helper
This widgets is highly inspired by google onboardings. This shows a circle around any widgets you want and add an overlay were you can add 
a message. 

First embbed you page or your app with a **HelperOrchestrator** widget. 
```dart
HelperOrchestrator(
    child: Scaffold(
        appBar: AppBar(
            title: Text(widget.title),
        ),
        body: ...
    ),
)
```

You now have to get a key *text1* for the widget you want to reference using 
```dart 
Text(
    '$_counter',
    key: HelperOrchestrator.of(context).generateKey('text1'),
),
```

### Example
You can now show an anchored helper using 
```dart
final helper = AnchoredHelper(
    anchorKeyId: 'text1',
    title: const Text('Title lorem pitume'),
    description: const Text('Lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum'),,
    bgColor: Colors.blue,
    leftBtnText: const Text('cancel'),
    rightBtnText: const Text('Ok, understood'),
    onError: () => print("widget not found"),
    positivBtnStyle: helperOutlineBtnStyle,
    negativeBtnStyle: helperOutlineBtnStyle,
    onLeftBtnTap: () => HelperOrchestrator.of(context).hideHelper(),
    onRightTap: () => HelperOrchestrator.of(context).hideHelper(),
    onTapAnchor: () => HelperOrchestrator.of(context).hideHelper(),
);

// this will show an overlayed anchored widget using the key text1
HelperOrchestrator.of(context).showAnchoredHelper('text1', helper);
```

### properties

| Property           |      description                             |  Required   |
|--------------------|----------------------------------------------|-------------|
| anchorKeyId        | The reference to the [Key] created by [HelperOrchestrator] |:white_check_mark:|
| title        | A Text widget to show as title | |
| description        | A Text widget to show as description | |
| bgColor        | A Color as Overlayed background | :white_check_mark: |
| leftBtnText        | A [Text] widget to show within the left button |  |
| rightBtnText        | A [Text] widget to show within the right button |  |
| onLeftBtnTap        | Action on tap left button |  |
| onRightTap        | Action on tap right button |  |
| onError        | Functions to call when widgets encounters any errors |  |
| leftBtnStyle        | Material style to  put on negativ button |  |
| rightBtnStyle        | Material style to  put on positiv button |  |
| onTapAnchor        | Action to call when user tap on anchor |  |
| widgetFactory        | The Widget factory to create the anchored helper. Default to AnchoredCircleHoleHelper.anchorFactory which creates a full overlay with an animated hole |  |

There is two Hole Anchor widget factories :
- ```AnchoredCircleHoleHelper.anchorFactory```: creates a circle hole (default value)
- ```AnchoredRectHoleHelper.anchorFactory``` : creates a rectangle hole on strict widget bounds

## Any question? 
Contact us on [our twitter](https://twitter.com/PalFlutter) or email gautier[@@]pal-plugin.tech
