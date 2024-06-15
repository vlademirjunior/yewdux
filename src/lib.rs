mod display_count;
mod increment_count;
mod stores;

use display_count::DisplayCount;
use increment_count::IncrementCount;
use yew::prelude::*;

#[function_component]
pub fn App() -> Html {
    html! {
        <div>
            <h1>{"Hello, Yewdux!"}</h1>
            <DisplayCount />
            <IncrementCount />
        </div>
    }
}
