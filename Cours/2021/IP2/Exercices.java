class Cellule {
    private int content;
    private Cellule next;

    public Cellule getNext() { return next; }
    public int getContent() { return content; }

    public Cellule(int i) {
        content = i;
        next = null;
    }

    public Cellule(int i, Cellule c) {
        content = i;
        next = c;
    }

    public void add(int elem) {
        Cellule temp = this;
        while (temp.next != null) temp = temp.next;
        temp.next = new Cellule(elem);
    }

    public boolean contains(int elem) {
        Cellule temp = this;
        while (temp != null && temp.content != elem) {
            temp = temp.next;
        }
        if (temp == null) return false;
        return true;
    }

    public int get(int index) {
        Cellule temp = this;
        while (index != 0 && temp != null) {
            temp = temp.next;
            index--;
        }
        if (temp == null) return -1;
        return temp.content;
    }

    public int indexOf(int elem) {
        int res = 0;
        Cellule temp = this;
        while (temp != null && temp.content != elem) {
            temp = temp.next;
            res++;
        }
        if (temp == null) return -1;
        return res;
    }

    public int size() {
        int res = 0;
        Cellule temp = this;
        while (temp != null) {
            res++;
            temp = temp.next;
        }
        return res;
    }

    public int set(int index, int elem) {
        Cellule temp = this;
        while (temp != null && index != 0) {
            temp = temp.next;
            index--;
        }
        if (temp == null) return -1;
        int old = temp.content;
        temp.content = elem;
        return old;
    }

    public int lastIndexOf(int elem) {
        int res = -1;
        int i= 0;
        Cellule temp = this;
        while (temp != null) {
            if (temp.content == elem) res =i;
            temp = temp.next;
            i++;
        }
        return res;
    }

    public void add(int index, int elem) {
        Cellule temp = this;
        while (index != 1 && temp.next != null) {
            temp = temp.next;
            index--;
        }
        temp.next = new Cellule(elem, temp.next);
    }

    public int remove(int index) {
        Cellule temp = this;
        while (index != 1 && temp.next != null) {
            temp = temp.next;
            index--;
        }
        if (temp.next == null) return -1;
        else {
            Cellule old = temp.next;
            temp.next = old.next;
            return old.content;
        }
    }

    public boolean removeElem(int elem) {
        Cellule temp = this;
        while (temp.next != null) {
            temp = temp.next;
            if (temp.content == elem) {
                temp.next = temp.next.next;
                return true;
            }
        }
        return false;
    }
}

class MaList {
    private Cellule first;

    public MaList() {
        this.first = null;
    }

    public boolean isEmpty() { return first == null; }

    public void clear() { first = null; }

    public void add(int elem) {
        if (this.isEmpty()) first = new Cellule(elem);
        else first.add(elem);
    }

    public boolean contains(int elem) {
        if (this.isEmpty()) return false;
        else return first.contains(elem);
    }

    public int get(int index) {
        if (this.isEmpty() || index < 0) return -1;
        else return first.get(index);
    }

    public int indexOf(int elem) {
        if (this.isEmpty() ) return -1;
        else return first.indexOf(elem);
    }

    public int size() {
        if (first == null) return 0;
        else return first.size();
    }

    public int set(int index, int elem) {
        if (this.isEmpty() || index < 0) return -1;
        else return first.set(index, elem);
    }

    public int lastIndexOf(int elem) {
        if (this.isEmpty()) return -1;
        else return first.lastIndexOf(elem);
    }

    public void add(int index, int elem) {
        if (index == 0 || first == null) first = new Cellule(elem, first);
        else first.add(index, elem);
    }

    public int remove(int index) {
        if (this.isEmpty() || index < 0) return -1;
        if (index == 0) {
            Cellule old_first = first;
            first = first.getNext();
            return old_first.getContent();
        }
        else return first.remove(index);
    }

    public boolean removeElem(int elem) {
        if (this.isEmpty()) return false;
        if (first.getContent() == elem) {
            first = first.getNext();
            return true;
        }
        else return first.removeElem(elem);
    }
}

class Exercices {
    public static void main(String[] args) {
    }
}
