use std::rc::Rc;

use yew::prelude::*;
use yewdux::prelude::*;

use crate::stores::counter_store::CounterStore;

pub enum Msg {
    StateChanged(Rc<CounterStore>),
    ButtonClicked,
}

pub struct IncrementCount {
    dispatch: Dispatch<CounterStore>,
    state: Rc<CounterStore>,
}

impl Component for IncrementCount {
    type Message = Msg;
    type Properties = ();

    fn create(ctx: &Context<Self>) -> Self {
        let callback = ctx.link().callback(Msg::StateChanged);
        // Subscribe to changes in state. New state is received in `update`. Be sure to save this,
        // dropping it will unsubscribe.
        let dispatch = Dispatch::<CounterStore>::global().subscribe_silent(callback);
        Self {
            // Get the current state.
            state: dispatch.get(),
            dispatch,
        }
    }

    fn update(&mut self, _ctx: &Context<Self>, msg: Msg) -> bool {
        match msg {
            // Receive new state.
            Msg::StateChanged(state) => {
                self.state = state;

                // Only re-render this component if count is greater that 0 (for this example).
                if self.state.count > 0 {
                    true
                } else {
                    false
                }
            }
            Msg::ButtonClicked => {
                self.dispatch
                    .reduce_mut(|state_changed: &mut CounterStore| state_changed.count += 1);
                false
            }
        }
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        let count = self.state.count;
        let onclick = ctx.link().callback(|_| Msg::ButtonClicked);
        html! {
            <>
            <h1>{ count }</h1>
            <button onclick={onclick}>{"+1"}</button>
            </>
        }
    }
}
