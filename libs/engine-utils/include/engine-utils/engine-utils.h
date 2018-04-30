#pragma once

#include <engine/engine.h>
#include <type_traits>

namespace cxp {
    template <typename T, typename = typename std::enable_if<std::is_integral<T>::value>::type>
    Engine make_engine(T) {
        return {};
    }
}