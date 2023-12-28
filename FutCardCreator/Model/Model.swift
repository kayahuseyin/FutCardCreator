//
//  Model.swift
//  FutCardCreator
//
//  Created by Hüseyin Kaya on 27.12.2023.
//

import Foundation

struct Model {
    
    static let imageNames = ["gold", "hereos", "icon", "thunderstruck", "potmBundesliga", "potmEpl", "potmEredivisie", "potmLaliga", "potmLigue1", "potmMls", "potmSerieA", "evolution", "totwRed"]
    
    static let countryFlags: [String: String] = [
        "United Arab Emirates": "🇦🇪",
        "Afghanistan": "🇦🇫",
        "Albania": "🇦🇱",
        "Algeria": "🇩🇿",
        "Andorra": "🇦🇩",
        "Angola": "🇦🇴",
        "Antigua & Barbuda": "🇦🇬",
        "Argentina": "🇦🇷",
        "Armenia": "🇦🇲",
        "Australia": "🇦🇺",
        "Austria": "🇦🇹",
        "Azerbaijan": "🇦🇿",
        "Bahamas": "🇧🇸",
        "Bahrain": "🇧🇭",
        "Bangladesh": "🇧🇩",
        "Barbados": "🇧🇧",
        "Belarus": "🇧🇾",
        "Belgium": "🇧🇪",
        "Belize": "🇧🇿",
        "Benin": "🇧🇯",
        "Bhutan": "🇧🇹",
        "Bolivia": "🇧🇴",
        "Bosnia & Herzegovina": "🇧🇦",
        "Botswana": "🇧🇼",
        "Brazil": "🇧🇷",
        "Brunei": "🇧🇳",
        "Bulgaria": "🇧🇬",
        "Burkina Faso": "🇧🇫",
        "Burundi": "🇧🇮",
        "Cabo Verde": "🇨🇻",
        "Cambodia": "🇰🇭",
        "Cameroon": "🇨🇲",
        "Canada": "🇨🇦",
        "Central African Republic": "🇨🇫",
        "Chad": "🇹🇩",
        "Chile": "🇨🇱",
        "China": "🇨🇳",
        "Colombia": "🇨🇴",
        "Comoros": "🇰🇲",
        "Congo": "🇨🇬",
        "Costa Rica": "🇨🇷",
        "Croatia": "🇭🇷",
        "Cuba": "🇨🇺",
        "Cyprus": "🇨🇾",
        "Czech Republic": "🇨🇿",
        "Denmark": "🇩🇰",
        "Djibouti": "🇩🇯",
        "Dominica": "🇩🇲",
        "Dominican Republic": "🇩🇴",
        "Ecuador": "🇪🇨",
        "Egypt": "🇪🇬",
        "El Salvador": "🇸🇻",
        "Equatorial Guinea": "🇬🇶",
        "Eritrea": "🇪🇷",
        "Estonia": "🇪🇪",
        "Eswatini": "🇸🇿",
        "Ethiopia": "🇪🇹",
        "Fiji": "🇫🇯",
        "Finland": "🇫🇮",
        "France": "🇫🇷",
        "Gabon": "🇬🇦",
        "Gambia": "🇬🇲",
        "Georgia": "🇬🇪",
        "Germany": "🇩🇪",
        "Ghana": "🇬🇭",
        "Greece": "🇬🇷",
        "Grenada": "🇬🇩",
        "Guatemala": "🇬🇹",
        "Guinea": "🇬🇳",
        "Guinea-Bissau": "🇬🇼",
        "Guyana": "🇬🇾",
        "Haiti": "🇭🇹",
        "Honduras": "🇭🇳",
        "Hungary": "🇭🇺",
        "Iceland": "🇮🇸",
        "India": "🇮🇳",
        "Indonesia": "🇮🇩",
        "Iran": "🇮🇷",
        "Iraq": "🇮🇶",
        "Ireland": "🇮🇪",
        "Israel": "🇮🇱",
        "Italy": "🇮🇹",
        "Jamaica": "🇯🇲",
        "Japan": "🇯🇵",
        "Jordan": "🇯🇴",
        "Kazakhstan": "🇰🇿",
        "Kenya": "🇰🇪",
        "Kiribati": "🇰🇮",
        "Korea, North": "🇰🇵",
        "Korea, South": "🇰🇷",
        "Kuwait": "🇰🇼",
        "Kyrgyzstan": "🇰🇬",
        "Laos": "🇱🇦",
        "Latvia": "🇱🇻",
        "Lebanon": "🇱🇧",
        "Lesotho": "🇱🇸",
        "Liberia": "🇱🇷",
        "Libya": "🇱🇾",
        "Liechtenstein": "🇱🇮",
        "Lithuania": "🇱🇹",
        "Luxembourg": "🇱🇺",
        "Madagascar": "🇲🇬",
        "Malawi": "🇲🇼",
        "Malaysia": "🇲🇾",
        "Maldives": "🇲🇻",
        "Mali": "🇲🇱",
        "Malta": "🇲🇹",
        "Marshall Islands": "🇲🇭",
        "Mauritania": "🇲🇷",
        "Mauritius": "🇲🇺",
        "Mexico": "🇲🇽",
        "Micronesia": "🇫🇲",
        "Moldova": "🇲🇩",
        "Monaco": "🇲🇨",
        "Mongolia": "🇲🇳",
        "Montenegro": "🇲🇪",
        "Morocco": "🇲🇦",
        "Mozambique": "🇲🇿",
        "Myanmar": "🇲🇲",
        "Namibia": "🇳🇦",
        "Nauru": "🇳🇷",
        "Nepal": "🇳🇵",
        "Netherlands": "🇳🇱",
        "New Zealand": "🇳🇿",
        "Nicaragua": "🇳🇮",
        "Niger": "🇳🇪",
        "Nigeria": "🇳🇬",
        "North Macedonia": "🇲🇰",
        "Norway": "🇳🇴",
        "Oman": "🇴🇲",
        "Pakistan": "🇵🇰",
        "Palau": "🇵🇼",
        "Palestine": "🇵🇸",
        "Panama": "🇵🇦",
        "Papua New Guinea": "🇵🇬",
        "Paraguay": "🇵🇾",
        "Peru": "🇵🇪",
        "Philippines": "🇵🇭",
        "Poland": "🇵🇱",
        "Portugal": "🇵🇹",
        "Qatar": "🇶🇦",
        "Romania": "🇷🇴",
        "Russia": "🇷🇺",
        "Rwanda": "🇷🇼",
        "Saint Kitts & Nevis": "🇰🇳",
        "Saint Lucia": "🇱🇨",
        "Saint Vincent & Grenadines": "🇻🇨",
        "Samoa": "🇼🇸",
        "San Marino": "🇸🇲",
        "Sao Tome & Principe": "🇸🇹",
        "Saudi Arabia": "🇸🇦",
        "Senegal": "🇸🇳",
        "Serbia": "🇷🇸",
        "Seychelles": "🇸🇨",
        "Sierra Leone": "🇸🇱",
        "Singapore": "🇸🇬",
        "Slovakia": "🇸🇰",
        "Slovenia": "🇸🇮",
        "Solomon Islands": "🇸🇧",
        "Somalia": "🇸🇴",
        "South Africa": "🇿🇦",
        "South Sudan": "🇸🇸",
        "Spain": "🇪🇸",
        "Sri Lanka": "🇱🇰",
        "Sudan": "🇸🇩",
        "Suriname": "🇸🇷",
        "Sweden": "🇸🇪",
        "Switzerland": "🇨🇭",
        "Syria": "🇸🇾",
        "Taiwan": "🇹🇼",
        "Tajikistan": "🇹🇯",
        "Tanzania": "🇹🇿",
        "Thailand": "🇹🇭",
        "Timor-Leste": "🇹🇱",
        "Togo": "🇹🇬",
        "Tonga": "🇹🇴",
        "Trinidad & Tobago": "🇹🇹",
        "Tunisia": "🇹🇳",
        "Türkiye": "🇹🇷",
        "Turkmenistan": "🇹🇲",
        "Tuvalu": "🇹🇻",
        "Uganda": "🇺🇬",
        "Ukraine": "🇺🇦",
        "United Kingdom": "🇬🇧",
        "United States": "🇺🇸",
        "Uruguay": "🇺🇾",
        "Uzbekistan": "🇺🇿",
        "Vanuatu": "🇻🇺",
        "Vatican City": "🇻🇦",
        "Venezuela": "🇻🇪",
        "Vietnam": "🇻🇳",
        "Yemen": "🇾🇪",
        "Zambia": "🇿🇲",
        "Zimbabwe": "🇿🇼"
    ]
    
}
