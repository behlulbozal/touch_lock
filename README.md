


# Touch Lock
###  A beautiful widget that can be presented to the end user to prevent incorrect touches on the screen.
Look photos

------------


#### Installation 

    dependencies:
      touch_lock: ^0.0.1

------------

#### Simple Usage

```dart
TouchLock(
      child: Scaffold(
        body: ... ,
      ),
    );
```

------------


#### Advanced Usage


```dart
TouchLock(
      backButton: TextButton(onPressed: null, child: Text('Click Me')) ,
      unlockButton: TextButton(onPressed: null, child: Text('Click Me')) ,
      lockButton: TextButton(onPressed: null, child: Text('Click Me'))... ,
      right: 20 , //Padding
      top: 20 , //Padding
      numbers: ['One','Two','Three','Four','Five','Six','Seven','Eight','Nine'] ,
      text: 'Choose' ,
      buttonSize: 40 ,
      child: ... ,
    );
```

------------

###### Photos
![photo](https://i.ibb.co/WPxNph2/photo-2021-05-21-02-25-50.jpg)
![photo](https://i.ibb.co/Wyr00DM/photo-2021-05-21-02-25-53.jpg)

------------

Behlul Bozal 
behlulbozal@gmail.com
