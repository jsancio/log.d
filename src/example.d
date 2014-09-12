import std.log;

void main(string[] args)
{
    info("You passed %s argument(s)", args.length - 1);
    info.when(args.length > 1).write("Arguments: ", args[1 .. $]);

    warning("This is a warning message.");
    error("This is an error message!");
    // FIXME dfatal("This is a debug fatal message");

    // FIXME vlog(1)("Verbosity 1 message");
    // FIXME vlog(2)("Verbosity 2 message");

    foreach (i; 0 .. 10)
    {
        info.when(every(9))("Every nine");

        if (info.willLog)
        {
            auto message = "Cool message";
            // perform some complex operation
            // ...
            info(message);
        }
    }

    try critical("Critical message");
    catch (CriticalException e)
    {
        // shutdown application...
    }

    fatal("This is a fatal message!!!");
    assert(false, "Never reached");
}
