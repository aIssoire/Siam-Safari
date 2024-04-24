// BottomTabNavigator.js
import React from 'react';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import Icon from 'react-native-vector-icons/FontAwesome';
import { useNavigation } from '@react-navigation/native';
import ProfileScreen from './src/Profile/Profile.js';
import AddPinScreen from './src/AddPin/AddPin.js';
import MainPageScreen from './src/MainPage/MainPage.js';

const Tab = createBottomTabNavigator();

export default function BottomTabNavigator() {
    const navigation = useNavigation();
    return (
        <Tab.Navigator>
            <Tab.Screen
                name="MainPageScreen"
                component={MainPageScreen}
                options={{
                    tabBarIcon: ({ color, size }) => (
                        <Icon name="home" size={size} color={color} />
                    ),
                    headerShown: false,
                }}
            />
            <Tab.Screen
                name="AddPinScreen"
                component={AddPinScreen}
                options={{
                    tabBarIcon: ({ color, size }) => (
                        <Icon name="cart" size={size} color={color} />
                    ),
                    headerShown: false,
                }}
            />
            <Tab.Screen
                name="ProfileScreen"
                component={ProfileScreen}
                options={{
                    tabBarIcon: ({ color, size }) => (
                        <Icon name="cart" size={size} color={color} />
                    ),
                    headerShown: false,
                }}
            />
            
        </Tab.Navigator>
    );
}