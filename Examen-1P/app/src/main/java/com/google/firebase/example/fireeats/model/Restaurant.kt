package com.google.firebase.example.fireeats.model

import com.google.firebase.firestore.IgnoreExtraProperties

/**
 * Restaurant POJO.
 */
@IgnoreExtraProperties
data class Restaurant(
    var nombre: String? = null,
    var idioma: String? = null,
    var region: String? = null,
    var photo: String? = null,
    var habitantes: Int = 0,
    var numRatings: Int = 0,
    var avgRating: Double = 0.toDouble()
) {

    companion object {

        const val FIELD_CITY = "idiomas"
        const val FIELD_CATEGORY = "region"
        const val FIELD_PRICE = "habitantes"
        const val FIELD_POPULARITY = "numRatings"
        const val FIELD_AVG_RATING = "avgRating"
    }
}
