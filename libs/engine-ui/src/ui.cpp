#include <engine-ui/ui.h>
#include <engine-utils/engine-utils.h>

namespace cxp {

    void EngineUI::DoUIStuff() {
        const auto engine = make_engine(1234);
        engine.Run(1234);
    }
}