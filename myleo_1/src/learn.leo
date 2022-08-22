// debug
function debug() {
    let is_valid = true;
    let b: u8 = is_valid ? 1 : 0;

    let f = Foo::new(); 

    f.mutate(); // Errors if "f" is not mutable.
    f.log(); // Prints "1"
}

circuit Foo {
    a: u32,

    // Instantiates a new Foo circuit with a = 0u32.
    function new() -> Self { // Self resolves to circuit type Foo
        return Self { a: 0u32 };
    }

    // Logs the self circuit variable to console.
    function log(self) {
        console.log("{}", self.a); // Errors if "self" keyword is not present.
    }

    // Mutates the self circuit variable a = 1u32.
    function mutate(mut self) {
        self.a = 1u32; // Errors if "mut self" keyword is not present.
    }
}