for i = 1, 100 do 
    mu:lock()
    t.a = t.a + 1
    print('Thread 2:', i, 'TA', t.a)
    mu:unlock()
end
