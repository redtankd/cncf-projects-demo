#![feature(proc_macro_hygiene, decl_macro)]

use rocket::get;
use rocket::routes;

#[get("/<caller_addr>")]
fn hello(caller_addr: String) -> String {
    format!(
        "HelloSubService at \"{}\", called by HelloService at \"{}\".",
        hostname::get_hostname().unwrap(),
        caller_addr
    )
}

fn main() {
    rocket::ignite().mount("/hello", routes![hello]).launch();
}
