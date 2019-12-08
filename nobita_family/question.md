__1. Ai là anh em với Munashi?__
    
    ?- sibling(X, munashi).

__2. Tổ tiên của Nobisake là ai (Tổ tiên là thế hệ trước ông bà)?__
    
    ?- ancestor(X, nobisake).

__3. Ai cùng huyết thống với Satoshi?__

    ?- blood_relation(satoshi, X).

__4. Ai là họ hàng với Nobirou (họ hàng là người cùng huyết thống hoặc vợ chồng của người cùng huyết thống mà không phải anh chị cha mẹ hay ông bà tổ tiên)?__

    ?- relative(Nobirou, X).

__5. Ai là con út của Nobiru?__

    ?- youngest_child(X, nobiru).

__6. Ai là con cả của Onna?__

    ?- oldest_child(X, onna).

__7. Ai là dì của Nobita?__

    ?- aunt(X, nobita).

__8. Ông chú (anh em của ông) của Nobisake là ai?__

    ?- grand_uncle(X, nobisake).

__9. Aiko trẻ hơn Mayumi?__

    ?- younger(aiko, mayumi).

__10. Ai là cháu của Nobiru?__

    ?- grandchild(X, nobiru).

__11. Nobita kết hôn với ai?__

    ?- married(nobita, X).

__12. Kể tên những anh em họ Nobita?__

    ?- setof(X, cousin(X, nobita), Result).

__13. Kể tên những anh em họ lớn tuổi hơn Nobita?__

    ?- setof(X, (cousin(X, nobita), older(X, nobita)), Result).

__14. Ai là người lớn tuổi nhất trong các anh em họ của Satoshi?__

    ?- cousin(X, satoshi), forall((cousin(Y, satoshi), X \= Y), older(X, Y)).

__15. Ai là em trai của Onna?__

    ?- younger_brother(onna, X).

__16. Ai là con gái của Minato?__

    ?- daughter(X, minato).

__17. Kể tên những cặp vợ chồng cùng tuổi?__

    ?- setof(X-Y, (married(X, Y), same_age(X, Y), male(X)), Result).

__18. Tổ tiên cao nhất của Sawashi trong sơ đồ?__

    ?- ancestor(X, sawashi), forall((ancestor(Y, sawashi), X \= Y), older(X, Y)).

__19. Liệt kê những cặp vợ chồng mà chồng là con út trong gia đình?__

    ?- setof(X-Y, (married(X, Y), male(X), youngest_child(X)), Result).

__20. Kể tên những người con chưa lập gia đình của Nobiru?__

    ?- child(X, nobiru), not(married(X, Y)).