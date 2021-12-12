package com.ccms.tools;

import java.util.ArrayList;
import java.util.List;

public class JsonFactory {
	public static List<Tree> buildtree(List<Tree> nodes, String id) {
		List<Tree> treeNodes = new ArrayList<Tree>();
		for (Tree treeNode : nodes) {
			Tree node = new Tree();
			node.setId(treeNode.getId());
			node.setName(treeNode.getName());
			if (id == treeNode.getpId()) {
				// 递给调用buildtree方法给TreeNode中的children属性赋值
				node.setChildren(buildtree(nodes, node.getId()));
				treeNodes.add(node);
			}
		}
		return treeNodes;
	}
}
