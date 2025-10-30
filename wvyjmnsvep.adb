-- Generic package for lists in Ada
generic
    type Item_Type is private;
package Generic_Lists is
    type List is limited private;
    
    procedure Append(L : in out List; Item : in Item_Type);
    procedure Remove_First(L : in out List);
    procedure Remove_Last(L : in out List);
    function Is_Empty(L : List) return Boolean;
    function Length(L : List) return Natural;
    procedure Clear(L : in out List);
    
    -- Cursor-based iteration
    type Cursor is private;
    function First(L : List) return Cursor;
    function Last(L : List) return Cursor;
    function Has_Element(C : Cursor) return Boolean;
    function Element(C : Cursor) return Item_Type;
    procedure Next(C : in out Cursor);
    procedure Previous(C : in out Cursor);
    
private
    type Node;
    type Node_Ptr is access Node;
    type Node is record
        Data : Item_Type;
        Next : Node_Ptr := null;
        Prev : Node_Ptr := null;
    end record;
    
    type List is record
        Head : Node_Ptr := null;
        Tail : Node_Ptr := null;
        Size : Natural := 0;
    end record;
    
    type Cursor is record
        Current : Node_Ptr := null;
        List_Ptr : access List := null;
    end record;
end Generic_Lists;

-- Package body
package body Generic_Lists is
    
    procedure Append(L : in out List; Item : in Item_Type) is
        New_Node : Node_Ptr := new Node'(Data => Item, Next => null, Prev => L.Tail);
    begin
        if L.Head = null then
            L.Head := New_Node;
        else
            L.Tail.Next := New_Node;
        end if;
        L.Tail := New_Node;
        L.Size := L.Size + 1;
    end Append;
    
    procedure Remove_First(L : in out List) is
        Old_Head : Node_Ptr := L.Head;
    begin
        if L.Head /= null then
            L.Head := L.Head.Next;
            if L.Head = null then
                L.Tail := null;
            else
                L.Head.Prev := null;
            end if;
            L.Size := L.Size - 1;
            -- Free memory (Ada doesn't have explicit free, but in a real implementation you might want to handle this)
        end if;
    end Remove_First;
    
    procedure Remove_Last(L : in out List) is
        Old_Tail : Node_Ptr := L.Tail;
    begin
        if L.Tail /= null then
            L.Tail := L.Tail.Prev;
            if L.Tail = null then
                L.Head := null;
            else
                L.Tail.Next := null;
            end if;
            L.Size := L.Size - 1;
            -- Free memory (Ada doesn't have explicit free, but in a real implementation you might want to handle this)
        end if;
    end Remove_Last;
    
    function Is_Empty(L : List) return Boolean is
    begin
        return L.Head = null;
    end Is_Empty;
    
    function Length(L : List) return Natural is
    begin
        return L.Size;
    end Length;
    
    procedure Clear(L : in out List) is
        Current : Node_Ptr := L.Head;
        Temp : Node_Ptr;
    begin
        while Current /= null loop
            Temp := Current.Next;
            Current := Temp;
        end loop;
        L.Head := null;
        L.Tail := null;
        L.Size := 0;
    end Clear;
    
    function First(L : List) return Cursor is
        Result : Cursor;
    begin
        Result.Current := L.Head;
        -- In a real implementation, you'd need to store a reference to the list
        return Result;
    end First;
    
    function Last(L : List) return Cursor is
        Result : Cursor;
    begin
        Result.Current := L.Tail;
        -- In a real implementation, you'd need to store a reference to the list
        return Result;
    end Last;
    
    function Has_Element(C : Cursor) return Boolean is
    begin
        return C.Current /= null;
    end Has_Element;
    
    function Element(C : Cursor) return Item_Type is
    begin
        return C.Current.Data;
    end Element;
    
    procedure Next(C : in out Cursor) is
    begin
        if C.Current /= null then
            C.Current := C.Current.Next;
        end if;
    end Next;
    
    procedure Previous(C : in out Cursor) is
    begin
        if C.Current /= null then
            C.Current := C.Current.Prev;
        end if;
    end Previous;
    
end Generic_Lists;