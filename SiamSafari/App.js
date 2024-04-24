import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import BottomTabNavigator from './BottomTabNavigator';


const RootStack = createStackNavigator();


export default function App() {
  return (
    <NavigationContainer>
      <RootStack.Navigator initialRouteName="Main">
        <RootStack.Screen
          name="Main"
          component={withAnalytics(BottomTabNavigator, 'BottomTabNavigator')}
          options={{ headerShown: false }}
        />
      </RootStack.Navigator>
    </NavigationContainer>
  );
}
