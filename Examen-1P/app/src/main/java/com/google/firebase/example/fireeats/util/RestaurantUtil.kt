package com.google.firebase.example.fireeats.util

import android.content.Context
import com.google.firebase.example.fireeats.R
import com.google.firebase.example.fireeats.model.Restaurant
import java.util.Arrays
import java.util.Locale
import java.util.Random

/**
 * Utilities for Restaurants.
 */
object RestaurantUtil {

    private const val RESTAURANT_URL_FMT = "https://storage.googleapis.com/firestorequickstarts.appspot.com/food_%d.png"
    private const val MAX_IMAGE_NUM = 22

    private val NAME_FIRST_WORDS = arrayOf("Azuay",
        "Bolivar", "Cañar", "Carchi", "Chimborazo", "Cotopaxi", "El Oro",
        "Esmeraldas", " Galápagos", "Guayas", " Imbabura", "Loja", "Los Ríos",
        "Manabí", "Morona Santiago", "Napo", "Orellana", "Pastaza", "Pichincha",
        "Santa Elena", "Santo Domingo de los Tsáchilas", "Sucumbíos", "Tungurahua",
        "Zamora Chimchipe")

    /**
     * Create a random Restaurant POJO.
     */
    fun getRandom(context: Context): Restaurant {
        val restaurant = Restaurant()
        val random = Random()

        // Cities (first elemnt is 'Any')
        var cities = context.resources.getStringArray(R.array.cities)
        cities = Arrays.copyOfRange(cities, 1, cities.size)

        // Categories (first element is 'Any')
        var categories = context.resources.getStringArray(R.array.categories)
        categories = Arrays.copyOfRange(categories, 1, categories.size)

        val prices = intArrayOf(1, 2, 3)

        restaurant.nombre = getRandomName(random)
        restaurant.idioma = getRandomString(cities, random)
        restaurant.region = getRandomString(categories, random)
        restaurant.photo = getRandomImageUrl(random)
        restaurant.habitantes = getRandomInt(prices, random)
        restaurant.numRatings = random.nextInt(20)

        // Note: average rating intentionally not set

        return restaurant
    }

    /**
     * Get a random image.
     */
    private fun getRandomImageUrl(random: Random): String {
        // Integer between 1 and MAX_IMAGE_NUM (inclusive)
        val id = random.nextInt(MAX_IMAGE_NUM) + 1

        return String.format(Locale.getDefault(), RESTAURANT_URL_FMT, id)
    }

    /**
     * Get price represented as dollar signs.
     */
    fun getPriceString(restaurant: Restaurant): String {
        return getPriceString(restaurant.habitantes)
    }

    /**
     * Get price represented as dollar signs.
     */
    fun getPriceString(priceInt: Int): String {
        when (priceInt) {
            1 -> return "menor de 100000"
            2 -> return "10000 a 500000"
            3 -> return "mayor a 500000"
            else -> return "mayor a 500000"
        }
    }

    private fun getRandomName(random: Random): String {
        return (getRandomString(NAME_FIRST_WORDS, random))
    }

    private fun getRandomString(array: Array<String>, random: Random): String {
        val ind = random.nextInt(array.size)
        return array[ind]
    }

    private fun getRandomInt(array: IntArray, random: Random): Int {
        val ind = random.nextInt(array.size)
        return array[ind]
    }
}
