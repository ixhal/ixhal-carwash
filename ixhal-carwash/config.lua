Config = {
    --Specify your framework.
    Framework = 'qbcore',--Supports 'qbcore' and 'esxlegacy'-- You can also use this with any other framework, Just check out the framework.lua file and edit it to your needs.
    button = {'Press ~INPUT_CONTEXT~ to wash your vehicle for ~g~$%s~s~', 0, 38},-- First entry is the message, second ectry is pad index, third entry is control key.
    only_dirty_vehicles = false,--This is lock car washed to dirty vehicles only (GetVehicleDirtLevel must be above 0.1)
    cost = 30,--How much it costs for a car wash
    cash_account_name = 'cash',--Name of your cash account (ESX would be 'money')
    bank_account_name = 'bank',--Name of your bank account balance
    double_clean = true,--This makes the washing process take 2x longer by making the particles loop back on them self.

    locations = {
        {
            name = 'Strawberry Carwash',--Name of the carwash
            location = vector3(23.68, -1391.92, 29.32),--Location for the carwash
            use_props = true,--Should we spawn the props? Some locations it will look out of place to have the props.
        },
        {
            name = 'Little Seoul Carwash',--Name of the carwash
            location = vector3(-699.84, -934.0, 19.0),--Location for the carwash
            use_props = true,--Should we spawn the props? Some locations it will look out of place to have the props.
        },
        {
            name = 'Paleto Carwash',--Name of the carwash
            location = vector3(-216.4, 6199.92, 31.48),--Location for the carwash
            use_props = false,--Should we spawn the props? Some locations it will look out of place to have the props.
        },
    },
}