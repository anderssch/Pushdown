/* 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

/*
 *  Copyright Morten K. Schou
 */

/* 
 * File:   std20.h
 * Author: Morten K. Schou <morten@h-schou.dk>
 *
 * Created on 25-02-2021.
 */

#ifndef PDAAAL_STD20_H
#define PDAAAL_STD20_H

// TODO: When C++20 arrives: Delete all this.
namespace std20{
    template< class T >
    struct remove_cvref {
        typedef std::remove_cv_t<std::remove_reference_t<T>> type;
    };
    template< class T >
    using remove_cvref_t = typename remove_cvref<T>::type;
}
namespace std20 {
    // Add contains method to unordered containers, until we can use the ones in C++20.
    template<typename Key, typename Tp,
            typename Hash = std::hash<Key>,
            typename Pred = std::equal_to<Key>,
            typename Alloc = std::allocator<std::pair<const Key, Tp>>>
    class unordered_map : public std::unordered_map<Key,Tp,Hash,Pred,Alloc> {
    public:
        bool contains(const Key &key) const {
            return this->find(key) != this->end();
        }
    };
    template<typename Value,
            typename Hash = std::hash<Value>,
            typename Pred = std::equal_to<Value>,
            typename Alloc = std::allocator<Value>>
    class unordered_set : public std::unordered_set<Value,Hash,Pred,Alloc> {
    public:
        bool contains(const Value &value) const {
            return this->find(value) != this->end();
        }
    };
}

#endif //PDAAAL_STD20_H
