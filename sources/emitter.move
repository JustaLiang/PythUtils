module pyth_utils::emitter {

    use sui::event;
    use pyth::state::{Self, State as PythState};
    // use pyth::price_info::PriceInfoObject;

    public struct PythPriceInfoObject has copy, drop {
        identifier: vector<u8>,
        id: ID
    }

    entry fun emit_price_info_object_id(
        pyth_state: &PythState,
        identifier: vector<u8>,
    ) {
        let id = state::get_price_info_object_id(
            pyth_state,
            identifier,
        );
        event::emit(PythPriceInfoObject{ identifier, id });
    }

}
