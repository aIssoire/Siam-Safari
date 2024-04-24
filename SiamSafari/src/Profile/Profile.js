import React, { useState, useEffect } from 'react';
import { StyleSheet, Text, View, TouchableOpacity, Button, Image, FlatList, SectionList } from 'react-native';
import { useNavigation } from '@react-navigation/native';


const ProfileScreen = () => {
    const navigation = useNavigation();

    return (
        <View>
         <Text>Page de profile</Text>
        </View>
    );
};

export default ProfileScreen;