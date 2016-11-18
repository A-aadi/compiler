var parse = function(tree){
    console.log('tree ',tree);
    if(typeof tree.left != 'number'){
        tree.left = parse(tree.left);
        return parse(tree);
    }

    if(typeof tree.right != 'number'){
        tree.right = parse(tree.right);
        return parse(tree);
    }

    return eval(tree.left + tree.op + tree.right);
};

exports.parse = parse;