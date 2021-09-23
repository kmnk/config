Ordering<Hoge> fugaOrdering =
    new Ordering<Hoge>() {
        @Override
        public int compare(Hoge a, Hoge b) {
            return a.fuga().compareTo(b.fuga());
        }
    };
